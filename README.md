# KISEC Final Project Presentation

A comprehensive security assessment and SIEM implementation presentation built with [Reveal.js](https://revealjs.com/).

## 🎯 Overview

This presentation covers:
- Security Assessment Results
- SIEM Architecture Implementation  
- Incident Response Timeline
- Malware Analysis (Mumblehard Miner, BPFDoor Rootkit)
- Future Security Recommendations

## 🚀 Quick Start

### View the Presentation Online
Visit: [https://aiegoo.github.io/siem](https://aiegoo.github.io/siem)

### Run Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/aiegoo/siem.git
   cd siem/kisec-final
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Start the development server:**
   ```bash
   npm start
   ```

4. **Open your browser to:**
   ```
   http://localhost:8080
   ```

## 📁 Project Structure

```
kisec-final/
├── index.html              # Main presentation entry point
├── slides.md               # Presentation content in Markdown
├── package.json            # Node.js dependencies
├── _config.yml             # GitHub Pages configuration
├── dist/                   # Reveal.js core files
├── plugin/                 # Reveal.js plugins
├── css/                    # Stylesheets and themes
├── theme/                  # Reveal.js themes
├── assets/                 # Images, media files
├── presentations/          # Additional presentation files
└── .github/workflows/      # GitHub Actions for deployment
```

## 🎨 Key Features

### Interactive Architecture Diagram
- **Animated SIEM Flow**: Components appear sequentially on click
- **Visual Hierarchy**: Clear data flow from endpoints to SOC dashboard
- **Responsive Design**: Adapts to different screen sizes

### Navigation Controls
- **Keyboard**: Arrow keys, spacebar, or page up/down
- **Mouse**: Click or scroll to navigate
- **Touch**: Swipe gestures on mobile devices

### Speaker Notes
- Press `S` to open speaker notes view
- Includes detailed explanations for each slide
- Perfect for presentations and training

## 🛠 Customization

### Editing Content
1. **Main Content**: Edit `slides.md` using Markdown syntax
2. **Styling**: Modify CSS in `index.html` or create custom themes
3. **Configuration**: Update reveal.js options in `index.html`

### Adding New Slides
```markdown
---
# New Slide Title
Your content here

Note:
Speaker notes go here
```

### Fragment Animations
```markdown
<div class="fragment">This appears on click</div>
<div class="fragment fade-in">This fades in</div>
<div class="fragment" data-fragment-index="1">This appears first</div>
```

## 🔧 Development

### Available Scripts
- `npm start` - Start development server
- `npm run build` - Build for production
- `npm run serve` - Serve built files
- `npm run deploy` - Deploy to GitHub Pages

### Dependencies
- **Reveal.js**: Presentation framework
- **http-server**: Local development server
- **gh-pages**: GitHub Pages deployment

## 🚀 Deployment

### Automatic Deployment
- Pushes to `main`, `master`, or `final-project` branches trigger automatic deployment
- GitHub Actions handles the build and deployment process
- Site is available at: `https://aiegoo.github.io/siem`

### Manual Deployment
```bash
npm run deploy
```

## 📋 GitHub Pages Setup

1. **Enable GitHub Pages** in repository settings
2. **Select Source**: GitHub Actions
3. **Configure Branch**: main/master/final-project
4. **Auto-deploy**: Configured via `.github/workflows/deploy.yml`

## 🎯 Presentation Tips

### Navigation
- Use **presenter mode** (`S` key) for speaker notes
- **Timer** and **slide counter** help with pacing
- **Overview mode** (`Esc` key) shows all slides

### Best Practices
- **Practice timing** with the fragment animations
- **Test on different devices** for responsive design
- **Use speaker notes** for detailed explanations
- **Prepare backup** (PDF export available)

## 🔒 Security Focus Areas

### Covered Topics
1. **Host Compromise Investigation**
2. **Malware Analysis & Removal**
3. **SIEM Architecture & Implementation**
4. **Incident Response Procedures**
5. **Future Security Recommendations**

### Technical Details
- **Vulnerability Assessment**: CVE analysis and patch management
- **Rootkit Detection**: eBPF-based threats (BPFDoor)
- **Crypto Mining**: Mumblehard miner investigation
- **System Hardening**: Complete remediation procedures

## 📞 Support

For questions or issues:
- **Repository Issues**: [GitHub Issues](https://github.com/aiegoo/siem/issues)
- **Email**: team@kisec.security
- **Documentation**: [Reveal.js Docs](https://revealjs.com/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**KISEC Final Project Team**  
Security Assessment & SIEM Implementation  
2025
