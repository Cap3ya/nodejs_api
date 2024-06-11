const Article = require('../model/Article.js');

exports.getAllArticles = (req, res) => {
    Article.getAllArticle(req.params.categorie, (err, articles) => {
        if (err) {
            res.send(err);
        } else {
            res.send(articles);
        }
    });
}

exports.createArticle = (req, res) => {
    let newArticle = new Article(req.body);
    Article.createArticle(newArticle, (err, article) => {
        if (err) {
            res.send(err);
        } else {
            res.json(article);
        }
    });
}

exports.readArticle = (req, res) => {
    Article.getArticleById(req.params.articleId, (err, article) => {
        if (err) {
            res.send(err);
        } else {
            res.send(article);
        }
    });
}

exports.updateArticle = (req, res) => {
    Article.updateArticleById(req.params.articleId, req.body, (err, article) => {
        if (err) {
            res.send(err);
        } else {
            res.json(article);
        }
    });
}

exports.deleteArticle = (req, res) => {
    Article.removeArticle(req.params.articleId, (err, article) => {
        if (err) {
            res.send(err);
        } else {
            res.json({ message: 'Article successfully deleted' });
        }
    });
}
