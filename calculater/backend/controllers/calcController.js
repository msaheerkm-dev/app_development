exports.calculate = (req, res) => {
    const { num1, num2, operator } = req.body;

    let result;
    switch (operator) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            result = num2 !== 0 ? num1 / num2 : 'Cannot divide by zero';
            break;
        default:
            return res.status(400).json({ error: 'Invalid operator' });
    }

    res.json({ result });
};