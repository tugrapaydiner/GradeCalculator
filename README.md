<div align="center">
  
# Dynamic Grade Calculator 📚🖩

A sophisticated, web-based tool crafted for the precise calculation of weighted grades, offering students and educators a seamless and interactive grading experience.

</div>

---

## 📖 Table of Contents

- [About the Project](#about-the-project)
  - [Built With](#built-with)
- [The Mathematics Behind the Calculator](#the-mathematics-behind-the-calculator)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage Guide](#usage-guide)

---

## 🌟 About the Project

The Dynamic Grade Calculator isn't just a tool; it's a reliable companion for the academic journey. With its intuitive layout and robust functionality, it stands out as an indispensable asset for managing and understanding grades.

### Built With

- [ASP.NET Web Forms](https://dotnet.microsoft.com/apps/aspnet/web-forms) - For creating a dynamic, server-side web application.
- [C#](https://docs.microsoft.com/en-us/dotnet/csharp/) - A modern, object-oriented programming language.
- [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) - For interactive web behaviors.
- [HTML5](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5) - For structuring the web content.
- [CSS3](https://developer.mozilla.org/en-US/docs/Web/CSS) - For styling and animating the web pages.

---

## 🧮 The Mathematics Behind the Calculator

At its core, the Dynamic Grade Calculator employs a series of mathematical operations to ensure that each assessment's weight is accurately reflected in the final grade. Here's a breakdown of the process:

- **Score Normalization**: Convert raw scores into a percentage form to standardize the varying total points.
  
  `Normalized Score = (Earned Points / Total Points) * 100`

- **Weighted Grade Calculation**: Determine the influence of each individual assessment on the overall grade.
  
  `Weighted Grade = Normalized Score * (Weight / 100)`

- **Aggregated Weighted Grades**: Add all weighted grades to get a cumulative figure that considers the specified weights.
  
  `Aggregated Weight = Sum of all Weighted Grades`

- **Final Grade Determination**: Divide the aggregated weight by the sum of the individual weights, provided they total 100%.
  
  `Final Grade = Aggregated Weight / Total Weights * 100`

---

## 🚦 Getting Started

To embark on this journey of grade calculation enlightenment, follow these simple steps:

### Prerequisites

- Ensure you have [.NET Framework](https://dotnet.microsoft.com/download/dotnet-framework) installed on your machine.
- Have [Visual Studio](https://visualstudio.microsoft.com/) ready for the best development experience.

### Installation

1. Clone the repository using Git:
   ```sh
   git clone https://github.com/tugrapaydiner/GradeCalculator.git

## 📐 Usage Guide

To get the most out of the Dynamic Grade Calculator, follow these user-friendly steps:

1. **Add Assessments**: Initiate your grading journey by clicking the 'Add Assessment' button. This allows you to create a new entry for each of your assessments.
   
2. **Enter Scores**: Input your scores in the format of `earned points/total points` (e.g., `28/30`). This represents the actual score you received.

3. **Assign Weights**: Specify the weight each assessment carries towards your final grade. Ensure the weights sum to 100% for accurate final grade computation.

4. **Observe the Results**: As soon as you enter your scores and weights, the calculated grades for each assessment and the overall final grade will automatically update.

---
## Screenshots :camera:

# D2L Page

![image](https://github.com/tugrapaydiner/GradeCalculator/assets/106766396/6d545c55-5df2-431d-85e5-99fc515e03ad)

# Dynamic Grade Calculator Page

![image](https://github.com/tugrapaydiner/GradeCalculator/assets/106766396/95424c27-4c44-4820-b358-52467405b877)

---
