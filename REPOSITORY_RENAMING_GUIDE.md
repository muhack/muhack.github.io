# Repository Renaming Guide for muhack.github.io

This guide provides comprehensive instructions for renaming the `muhack.github.io` repository, including all necessary considerations and steps specific to GitHub Pages sites with custom domains.

## Important Considerations

### 1. GitHub Pages Impact
- **Current Setup**: This repository uses the `[organization].github.io` naming convention for GitHub Pages
- **Custom Domain**: The site uses a custom domain `muhack.org` (configured in CNAME file)
- **Impact**: Since you have a custom domain, renaming the repository **will NOT** break your website
- **Hosting**: GitHub Pages will continue to work with any repository name when using a custom domain

### 2. Repository References
The following files in this repository reference related GitHub repositories:
- `_posts/2022-12-20-custom-muhack-sticker.md` - Contains link to `https://github.com/muhack/muhack_svg`

### 3. External Impact Assessment
- ✅ **Website functionality**: Will continue to work (custom domain configured)
- ✅ **Domain resolution**: Will not be affected
- ⚠️ **External links**: Any links pointing to `github.com/muhack/muhack.github.io` will need updates
- ⚠️ **SEO/Search indexing**: GitHub will redirect, but updating external references is recommended
- ⚠️ **Documentation**: README and other docs may need updates

## Step-by-Step Renaming Process

### Phase 1: Preparation (Before Renaming)
1. **Document current state**
   - Current repository name: `muhack.github.io`
   - Custom domain: `muhack.org`
   - Repository URL: `https://github.com/muhack/muhack.github.io`

2. **Identify external references**
   - Bookmark/note any external sites linking to this repository
   - Check if the repository is referenced in other muhack repositories
   - Review any CI/CD systems or external services using the repository URL

3. **Backup considerations**
   - Repository content is already version-controlled
   - Consider exporting issues/discussions if important
   - Document any webhook URLs or external integrations

### Phase 2: Repository Renaming (GitHub Web Interface)
1. **Navigate to repository settings**
   - Go to `https://github.com/muhack/muhack.github.io`
   - Click on "Settings" tab
   - Scroll to "Repository name" section

2. **Perform the rename**
   - Enter your new repository name (e.g., `muhack-website`, `muhack-site`, etc.)
   - Click "Rename" button
   - GitHub will handle URL redirects automatically

3. **Verify GitHub Pages**
   - Go to Settings > Pages
   - Confirm source is still configured correctly
   - Verify custom domain `muhack.org` is still set

### Phase 3: Update Local Repository
1. **Update remote URL**
   ```bash
   git remote set-url origin https://github.com/muhack/NEW_REPOSITORY_NAME
   ```

2. **Verify the change**
   ```bash
   git remote -v
   ```

### Phase 4: Update Documentation (if needed)
1. **Update README.md**
   - Change title from "muhack-website" to reflect new name if desired
   - Update any repository references

2. **Update repository references**
   - No internal references to update in this repository
   - External repositories may need updates

### Phase 5: Verification and Communication
1. **Test website functionality**
   - Visit `muhack.org` to confirm site still works
   - Test all major pages and functionality
   - Verify Jekyll build is working

2. **Update external references**
   - Update any documentation referencing the old repository name
   - Notify team members of the change
   - Update any external services or integrations

3. **Monitor for issues**
   - Watch for broken external links
   - Monitor website analytics for any traffic changes
   - Check for any CI/CD pipeline issues

## Recommended Repository Names

Consider these naming options that maintain clarity:
- `muhack-website` - Clear and descriptive
- `muhack-site` - Short and clear
- `website` - Simple (if within muhack organization)
- `muhack.org` - Matches domain name
- `portal` - Descriptive of function

## Rollback Plan

If issues arise:
1. GitHub provides automatic redirects from old to new repository URLs
2. You can rename the repository back to `muhack.github.io` if needed
3. Custom domain configuration should remain intact throughout

## Post-Rename Checklist

- [ ] Repository renamed successfully
- [ ] Local git remote updated
- [ ] Website `muhack.org` still accessible
- [ ] GitHub Pages configuration intact
- [ ] CNAME file still contains `muhack.org`
- [ ] Team members notified
- [ ] External documentation updated
- [ ] Any CI/CD pipelines updated
- [ ] External service webhooks updated (if any)

## Notes

- GitHub automatically creates redirects from the old repository URL to the new one
- The custom domain setup in the CNAME file ensures website continuity
- This is a low-risk operation for this specific repository due to the custom domain configuration
- The GitHub Pages site will continue to be served from `muhack.org` regardless of repository name

## Support

If you encounter issues during the renaming process:
1. Check GitHub Pages settings to ensure configuration is intact
2. Verify CNAME file still contains the correct domain
3. Contact GitHub Support if redirects are not working
4. Repository can be renamed back if necessary

---

**Important**: This repository uses a custom domain (`muhack.org`), which means renaming it will have minimal impact on website functionality. The site will continue to work normally after renaming.