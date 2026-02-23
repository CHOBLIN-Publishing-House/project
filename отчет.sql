SELECT z.[отделение_id], o.[адрес], SUM(z.[запрошенная_сумма]) as "Сумма" FROM [Заказы] z
LEFT JOIN [Отделения] o ON z.отделение_id = o.отделение_id
WHERE MONTH(z.[дата_фактической_выдачи]) = MONTH(GETDATE())
  AND YEAR(z.[дата_фактической_выдачи]) = YEAR(GETDATE())
GROUP BY z.[отделение_id], o.[адрес]