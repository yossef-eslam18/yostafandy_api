import type { Schema, Struct } from '@strapi/strapi';

export interface ProductLwnAlmntj extends Struct.ComponentSchema {
  collectionName: 'components_product_lwn_almntj';
  info: {
    displayName: '\u0644\u0648\u0646 \u0627\u0644\u0645\u0646\u062A\u062C';
    icon: 'brush';
  };
  attributes: {
    color_code: Schema.Attribute.String;
    color_name: Schema.Attribute.String;
    quantity: Schema.Attribute.Integer;
  };
}

declare module '@strapi/strapi' {
  export namespace Public {
    export interface ComponentSchemas {
      'product.lwn-almntj': ProductLwnAlmntj;
    }
  }
}
