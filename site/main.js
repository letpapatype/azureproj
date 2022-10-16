window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})
// the event of the page being loaded is the trigger to run getVisitCount 

const functionApiUrl = "https://getresumecounterjn.azurewebsites.net/api/GetResumeCounter?code=zotKB/ewwBX9eLBdtCMPrPwUreURCKmCXaXDkIW2eGvV5DjrRduMWg=="

const localFunctionApi = 'http://localhost:7071/api/GetResumeCounter';
// this script is unsed to pull data from the CosmosDB API and return the number on the website.

const getVisitCount = () => {
    let count = 30;
    fetch(functionApiUrl).then(response => {
        return response.json()
    }).then(response => {
        console.log("Website called function API.");
        count = response.count;
        document.getElementById("counter").innerText = count;
    }).catch(function (error) {
        console.log(error);
    })
    return count;
}


