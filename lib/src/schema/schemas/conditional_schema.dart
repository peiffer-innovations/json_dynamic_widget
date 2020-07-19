class ConditionalSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/conditional';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'oneOf': [
      {
        'type': 'null',
      },
      {
        'type': 'string',
      },
      {
        'type': 'object',
        'additionalProperties': true,
      }
    ],
  };
}
