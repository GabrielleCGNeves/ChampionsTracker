const dateFormat = (dataOriginal) => {
    let regex = /(\w{3}) (\w{3}) (\d{2}) (\d{4})/;
    let match = regex.exec(dataOriginal);

    if (match) {
        const meses = {
            Jan: "Janeiro",
            Feb: "Fevereiro",
            Mar: "Março",
            Apr: "Abril",
            May: "Maio",
            Jun: "Junho",
            Jul: "Julho",
            Aug: "Agosto",
            Sep: "Setembro",
            Oct: "Outubro",
            Nov: "Novembro",
            Dec: "Dezembro",
        };

        let [mes, dia, ano] = match.slice(2, 5);

        return `${dia} de ${meses[mes]}, ${ano}`;
    } else {
        return "Erro ao Formatar a Data";
    }
};
const getSumOfJogadores = (equipes) => {
    return equipes.reduce((sum, equipe) => sum + equipe.numeroJogadores, 0);
};

const capitalizeFirstLetter = (string) => {
    return string.charAt(0).toUpperCase() + string.slice(1).toLowerCase();
};

export {
    dateFormat,
    getSumOfJogadores,
    capitalizeFirstLetter
};