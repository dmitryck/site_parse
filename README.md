# Тестовое задание IKITlab

1. Зайти сюда https://certification.pmi.org/registry.aspx
2. Выбрать Russian Federation
3. Перебрать в поле Last Name буквы алфавита от A до Z
4. Для каждой распарсить страницу результатов поиска и сложить это в таблицу в БД.
  * В некоторых строках могут отсутствовать Name, City, Country: например для буквы "B" после строки: "Vadim Bogdanov Moscow Russian Federation PMP 12 Mar 2013 Active" идет строка: "<empty space> PfMP 26 Feb 2014 Active" — это означает что имя, город и страна такие же как и в предыдущей строке.

# Smoke

```bash
git clone https://github.com/dmitryck/ikitlab-testcase.git

cd ikitlab-testcase

bundle

# рекомедую перебрать сначала пару-тройку букв:
ruby cli-runner RUS A C

# если нужен весь диапазон (займет время):
ruby cli-runner RUS A Z
```

В базу складывать не стал, к этому сервису не относится. `csv` на выходе вполне достаточно
