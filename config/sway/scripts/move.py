#!/usr/bin/env python3
import sys
import i3ipc


def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    direction = sys.argv[1].lower()
    if direction not in ("left", "right", "up", "down"):
        sys.exit(1)

    i3 = i3ipc.Connection()
    tree = i3.get_tree()
    focused = tree.find_focused()

    if not focused or focused.type != "con":
        i3.command(f"move {direction}")
        return

    # If floating, move floating window normally
    if focused.floating and focused.floating.endswith("_on"):
        i3.command(f"move {direction}")
        return

    ws = focused.workspace()
    if not ws:
        return

    leaves = [
        w
        for w in ws.leaves()
        if w.type != "floating_con" and not (w.floating or "").endswith("_on")
    ]

    if len(leaves) <= 1:
        return

    fx1 = focused.rect.x
    fy1 = focused.rect.y
    fx2 = fx1 + focused.rect.width
    fy2 = fy1 + focused.rect.height

    # 1. Look for an adjacent neighbor in the target direction
    best_candidate = None
    min_dist = float("inf")
    max_overlap = -1

    for w in leaves:
        if w.id == focused.id:
            continue
        wx1 = w.rect.x
        wy1 = w.rect.y
        wx2 = wx1 + w.rect.width
        wy2 = wy1 + w.rect.height

        if direction == "right":
            if wx1 >= fx2 - 10:
                overlap = min(fy2, wy2) - max(fy1, wy1)
                if overlap > 10:
                    dist = wx1 - fx2
                    if dist < min_dist or (dist == min_dist and overlap > max_overlap):
                        min_dist = dist
                        max_overlap = overlap
                        best_candidate = w
        elif direction == "left":
            if wx2 <= fx1 + 10:
                overlap = min(fy2, wy2) - max(fy1, wy1)
                if overlap > 10:
                    dist = fx1 - wx2
                    if dist < min_dist or (dist == min_dist and overlap > max_overlap):
                        min_dist = dist
                        max_overlap = overlap
                        best_candidate = w
        elif direction == "down":
            if wy1 >= fy2 - 10:
                overlap = min(fx2, wx2) - max(fx1, wx1)
                if overlap > 10:
                    dist = wy1 - fy2
                    if dist < min_dist or (dist == min_dist and overlap > max_overlap):
                        min_dist = dist
                        max_overlap = overlap
                        best_candidate = w
        elif direction == "up":
            if wy2 <= fy1 + 10:
                overlap = min(fx2, wx2) - max(fx1, wx1)
                if overlap > 10:
                    dist = fy1 - wy2
                    if dist < min_dist or (dist == min_dist and overlap > max_overlap):
                        min_dist = dist
                        max_overlap = overlap
                        best_candidate = w

    if best_candidate:
        i3.command(
            f"[con_id={focused.id}] swap container with con_id {best_candidate.id}"
        )
        return

    # 2. No direct neighbor in that direction
    if len(leaves) == 2:
        other = [w for w in leaves if w.id != focused.id][0]
        ox1 = other.rect.x
        oy1 = other.rect.y
        ox2 = ox1 + other.rect.width
        oy2 = oy1 + other.rect.height

        h_overlap = max(0, min(fx2, ox2) - max(fx1, ox1))
        v_overlap = max(0, min(fy2, oy2) - max(fy1, oy1))
        is_side_by_side = v_overlap > h_overlap

        if is_side_by_side:
            if direction in ("left", "right"):
                # Already at horizontal edge
                return
            elif direction == "down":
                # Move focused below other
                i3.command(f"[con_id={focused.id}] focus; move down")
            elif direction == "up":
                # Move focused above other
                i3.command(
                    f"[con_id={other.id}] focus; move down; [con_id={focused.id}] focus"
                )
        else:
            # Stacked vertically
            if direction in ("up", "down"):
                # Already at vertical edge
                return
            elif direction == "right":
                # Move focused to right of other
                i3.command(f"[con_id={focused.id}] focus; move right")
            elif direction == "left":
                # Move focused to left of other
                i3.command(
                    f"[con_id={other.id}] focus; move right; [con_id={
                        focused.id
                    }] focus"
                )
        return

    # If 3+ windows and no adjacent neighbor, fallback to sway native move
    i3.command(f"move {direction}")


if __name__ == "__main__":
    main()
