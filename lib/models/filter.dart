enum OrderBy {TIME, PRICE}

const SECTION_TYPE_GERAL = 1 << 0;
const SECTION_TYPE_HORTIFRUTIS = 1 << 1;

class Filter {
  Filter({
    this.search,
    this.orderBy = OrderBy.TIME,
    this.maxPrice,
    this.minPrice,
    this.sectionType = SECTION_TYPE_GERAL | SECTION_TYPE_HORTIFRUTIS, int SectionType,
});

  String search;

  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int sectionType;

}

