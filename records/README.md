# records (within the `code` repo)

This folder is the **source-code repo** for your Records tooling (Python scripts + launchers + design docs).

**Do not** commit:
- `D:\\records\\.env` (secrets)
- Discogs caches / downloaded images
- generated HTML outputs (those belong in your separate `Records` publish repo if you want)

## Recommended runtime vs repo split

- **Runtime (not in git):**
  - `D:\\records\\` (contains `.env`, caches, outputs, etc.)
- **This repo (in git):**
  - `C:\\Users\\David\\Documents\\GitHub\\code\\records\\`

## Typical flow

1. Update scripts **in this repo**.
2. Run `deploy\\deploy_offline_gallery_to_D_records.bat` to copy the latest script/launcher into `D:\\records\\offline_gallery\\`.
3. Run `D:\\records\\offline_gallery\\run_offline_gallery.bat`.
4. (Optional) Run `deploy\\deploy_output_to_publish_repo.bat` to copy `index.html` + `images\\` into your publish repo:
   `C:\\Users\\David\\Documents\\GitHub\\Records\\`

## .env
Create `D:\\records\\.env` (runtime only). Use `templates\\.env.example` as a reference.
