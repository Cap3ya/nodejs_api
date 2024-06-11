let sql = require('./db.js');

class Article {
    constructor(article) {
        this.name = article.name;
        this.price = article.price;
        this.description = article.description;
        this.category_id = article.category_id;
        this.created_at = new Date();
    }

    static getAllArticle(categorie, result) {
        let cat = categorie === 'all' ? '' : categorie;
        sql.query(
            "SELECT article.id, article.name, description, price, image, category_id FROM article INNER JOIN category ON category.id = article.category_id WHERE category.name LIKE ?",
            ['%' + cat + '%'],
            (err, res) => {
                if (err) {
                    result(err, null);
                } else {
                    result(null, res);
                }
            }
        );
    }

    static getArticleById(articleId, result) {
        sql.query(
            "SELECT article.id, article.name, description, price, image, category_id FROM article INNER JOIN category ON category.id = article.category_id WHERE article.id = ?",
            [articleId],
            (err, res) => {
                if (err) {
                    result(err, null);
                } else {
                    result(null, res);
                }
            }
        );
    }

    static createArticle(newArticle, result) {
        sql.query("INSERT INTO article SET ?", newArticle, (err, res) => {
            if (err) {
                result(err, null);
            } else {
                result(null, { id: res.insertId, ...newArticle });
            }
        });
    }

    static updateArticleById(id, article, result) {
        sql.query(
            "UPDATE article SET name = ?, description = ?, price = ?, category_id = ? WHERE id = ?",
            [article.name, article.description, article.price, article.category_id, id],
            (err, res) => {
                if (err) {
                    result(err, null);
                } else {
                    result(null, { id: id, ...article });
                }
            }
        );
    }

    static removeArticle(id, result) {
        sql.query("DELETE FROM article WHERE id = ?", [id], (err, res) => {
            if (err) {
                result(err, null);
            } else {
                result(null, res);
            }
        });
    }
}

module.exports = Article;
