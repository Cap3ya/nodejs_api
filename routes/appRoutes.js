module.exports = (app) => {
    let functionController = require('../controller/appController.js');

    app.route('/articles/:categorie')
        .get(functionController.getAllArticles);

    app.route('/articles')
        .post(functionController.createArticle);

    app.route('/articles/:categorieId')
        .get(functionController.readArticle)
        .put(functionController.updateArticle)
        .delete(functionController.deleteArticle);
}