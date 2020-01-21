module.exports = {
    Config: {
        timeframes : {
            '1H': 60*60,
            '7H': 7*60*60,
            '1D': 24*60*60
        },
        API: {
            v1: 'https://api.coincap.io/v2/rates/:coin:',
        }
    }
};