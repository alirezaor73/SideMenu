#ifndef ELAHITABLEMODEL_H
#define ELAHITABLEMODEL_H

#include <QAbstractTableModel>

//inherit elahi from QAbstractModel
class ElahiTableModel : public QAbstractTableModel
{
    Q_OBJECT

public:
    ElahiTableModel(QObject *parent = nullptr ) : QAbstractTableModel( parent ){

    }

    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return 10;
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return 10;
    }

    QVariant data(const QModelIndex &index, int role) const override
    {
        switch (role) {
            case Qt::DisplayRole:
                return QString("%1 , %2").arg(index.column()).arg(index.row());
//                return index.column();
            default:
                break;
        }

        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override
    {
        return { {Qt::DisplayRole, "txtPass"} };
    }


};


#endif // ELAHITABLEMODEL_H
