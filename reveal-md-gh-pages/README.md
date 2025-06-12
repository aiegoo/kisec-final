# Reveal-md GitHub Pages Presentation

This project uses Reveal-md to create a presentation from Markdown files. The presentation content is located in the `slides/slides.md` file, which is structured into slides with titles and notes.

## Project Structure

- `slides/`: Contains the Markdown file for the presentation.
  - `slides.md`: The main content of the presentation.
- `dist/`: This folder will store the generated HTML files and assets for the Reveal.js presentation.
- `package.json`: Configuration file for npm, specifying project metadata and dependencies.
- `.gitignore`: Specifies files and directories to be ignored by Git.
- `README.md`: Documentation for the project.

## Getting Started

To set up the project, follow these steps:

1. **Clone the repository**:
   ```
   git clone <repository-url>
   cd reveal-md-gh-pages
   ```

2. **Install dependencies**:
   ```
   npm install
   ```

3. **Build the presentation**:
   ```
   npm run build
   ```

4. **Serve the presentation locally**:
   ```
   npm run serve
   ```

5. **Deploy to GitHub Pages**:
   Follow the instructions in the GitHub Pages documentation to deploy the contents of the `dist/` folder.

## Usage

Edit the `slides/slides.md` file to update the presentation content. Each slide is separated by `---`, and you can add notes for each slide using the `Note:` section.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.