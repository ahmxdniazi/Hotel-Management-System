# Contributing to Hotel Management System

Thank you for your interest in contributing! 🎉

## How to Contribute

### Reporting Bugs

If you find a bug:
1. Check [existing issues](../../issues) to avoid duplicates
2. Open a new issue with the **Bug Report** template
3. Include: steps to reproduce, expected vs actual behavior, screenshots if applicable

### Suggesting Features

1. Open an issue with the **Feature Request** label
2. Describe the feature and why it would be useful
3. Be specific about expected behavior

### Submitting Code

1. **Fork** the repository and create your branch:
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/bug-description
   ```

2. **Follow code conventions:**
   - Use meaningful variable/method names
   - Add comments for complex logic
   - Follow Java naming conventions (camelCase for methods/variables, PascalCase for classes)

3. **Test your changes** thoroughly before submitting

4. **Commit with clear messages:**
   ```
   Add: room availability filter feature
   Fix: invoice total calculation bug
   Update: guest registration form validation
   Docs: update setup instructions
   ```

5. **Open a Pull Request** with:
   - A clear title and description
   - Reference to any related issue (`Closes #12`)
   - Screenshots if UI changes are involved

## Code Style

- Indent with **4 spaces** (no tabs)
- Keep methods focused and short (single responsibility)
- Handle exceptions properly — never swallow errors silently
- Close database connections in `finally` blocks or use try-with-resources

## Questions?

Open a [Discussion](../../discussions) or reach out via the Issues tab.
