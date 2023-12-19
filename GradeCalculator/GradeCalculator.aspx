<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradeCalculator.aspx.cs" Inherits="GradeCalculator.GradeCalculator" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dynamic Grade Calculator</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    var assessmentCount = 0;

    function addAssessment() {
        var container = document.getElementById("assessmentContainer").getElementsByTagName('tbody')[0];
        var row = container.insertRow(container.rows.length);
        var itemName = '<input type="text" name="itemName' + assessmentCount + '" placeholder="Item Name" class="item-name" />';
        var scoreInput = '<input type="text" name="score' + assessmentCount + '" placeholder="e.g., 28/30" class="score" oninput="calculateGrade(this)" required />';
        var weightInput = '<input type="number" name="weight' + assessmentCount + '" placeholder="Weight (%)" class="weight" oninput="calculateGrade(this)" required />';
        var gradeCell = '<span class="grade-cell"></span>';
        var deleteButton = '<button type="button" class="delete-btn" onclick="removeAssessment(this);">&#10006;</button>';

        row.innerHTML = `<td>${itemName}</td><td>${scoreInput}</td><td>${weightInput}</td><td>${gradeCell}</td><td>${deleteButton}</td>`;
        assessmentCount++;
    }

    function removeAssessment(btn) {
        var row = btn.parentNode.parentNode;
        row.parentNode.removeChild(row);
        calculateFinalGrade(); // Recalculate final grade after removing an item
    }

    function calculateGrade(input) {
        var row = input.closest('tr');
        var scoreInput = row.querySelector('.score').value.split('/');
        var weightInput = row.querySelector('.weight').value;
        var gradeCell = row.querySelector('.grade-cell');

        if (scoreInput.length === 2) {
            var earnedPoints = parseFloat(scoreInput[0]);
            var totalPoints = parseFloat(scoreInput[1]);
            if (!isNaN(earnedPoints) && !isNaN(totalPoints) && totalPoints > 0) {
                var gradePercentage = (earnedPoints / totalPoints) * 100;
                gradeCell.textContent = gradePercentage.toFixed(2) + '%';
            } else {
                gradeCell.textContent = '';
            }
        } else {
            gradeCell.textContent = '';
        }

        // Debounce the final grade calculation to avoid incorrect calculations
        clearTimeout(input.dataset.timer);
        input.dataset.timer = setTimeout(function () {
            calculateFinalGrade();
        }, 800);
    }

    function calculateFinalGrade() {
        var container = document.getElementById('assessmentContainer').querySelector('tbody');
        var rows = container.querySelectorAll('tr');
        var totalWeightedGrade = 0;
        var totalWeights = 0;
        var error = false;

        for (var i = 0; i < rows.length; i++) {
            var scoreInput = rows[i].querySelector('.score').value.split('/');
            var weightInput = rows[i].querySelector('.weight').value;
            var gradeCell = rows[i].querySelector('.grade-cell');

            if (scoreInput.length === 2 && weightInput) {
                var earnedPoints = parseFloat(scoreInput[0]);
                var totalPoints = parseFloat(scoreInput[1]);
                var weight = parseFloat(weightInput);
                if (!isNaN(earnedPoints) && !isNaN(totalPoints) && !isNaN(weight) && totalPoints > 0 && weight > 0) {
                    var gradePercentage = (earnedPoints / totalPoints) * 100;
                    var weightedGrade = (gradePercentage * weight) / 100;
                    totalWeightedGrade += weightedGrade;
                    totalWeights += weight;
                } else {
                    error = true;
                }
            }
        }

        if (error || totalWeights !== 100) {
            document.getElementById('lblResult').textContent = 'Error: Please check that all fields are filled correctly and weights sum to 100%.';
        } else {
            var finalGrade = totalWeightedGrade / totalWeights * 100;
            document.getElementById('lblResult').textContent = 'Final Grade: ' + finalGrade.toFixed(2) + '%';
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Dynamic Grade Calculator</h2>
            <table id="assessmentContainer">
                <thead>
                    <tr>
                        <th>Grade Item</th>
                        <th>Points</th>
                        <th>Weight</th>
                        <th>Grade</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <button type="button" class="add-btn" onclick="addAssessment();">Add Assessment</button>
            <div id="errorContainer"></div>
            <div id="resultContainer">
                <asp:Label ID="lblResult" runat="server" Text="Final Grade: "></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>