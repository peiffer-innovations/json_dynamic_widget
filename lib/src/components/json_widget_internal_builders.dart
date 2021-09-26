import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';

class JsonWidgetInternalBuilders {
  static Map<String, JsonWidgetBuilderContainer> get builders =>
      const <String, JsonWidgetBuilderContainer>{
        JsonAlignBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAlignBuilder.fromDynamic,
          schemaId: AlignSchema.id,
        ),
        JsonAnimatedAlignBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedAlignBuilder.fromDynamic,
          schemaId: AnimatedAlignSchema.id,
        ),
        JsonAnimatedContainerBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedContainerBuilder.fromDynamic,
          schemaId: AnimatedContainerSchema.id,
        ),
        JsonAnimatedCrossFadeBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedCrossFadeBuilder.fromDynamic,
          schemaId: AnimatedCrossFadeSchema.id,
        ),
        JsonAnimatedDefaultTextStyleBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedDefaultTextStyleBuilder.fromDynamic,
          schemaId: AnimatedDefaultTextStyleSchema.id,
        ),
        JsonAnimatedOpacityBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedOpacityBuilder.fromDynamic,
          schemaId: AnimatedOpacitySchema.id,
        ),
        JsonAnimatedPaddingBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedPaddingBuilder.fromDynamic,
          schemaId: AnimatedPaddingSchema.id,
        ),
        JsonAnimatedPhysicalModelBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedPhysicalModelBuilder.fromDynamic,
          schemaId: AnimatedPhysicalModelSchema.id,
        ),
        JsonAnimatedPositionedBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedPositionedBuilder.fromDynamic,
          schemaId: AnimatedPositionedSchema.id,
        ),
        JsonAnimatedPositionedDirectionalBuilder.type:
            JsonWidgetBuilderContainer(
          builder: JsonAnimatedPositionedDirectionalBuilder.fromDynamic,
          schemaId: AnimatedPositionedDirectionalSchema.id,
        ),
        JsonAnimatedSizeBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedSizeBuilder.fromDynamic,
          schemaId: AnimatedSizeSchema.id,
        ),
        JsonAnimatedSwitcherBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedSwitcherBuilder.fromDynamic,
          schemaId: AnimatedSwitcherSchema.id,
        ),
        JsonAnimatedThemeBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAnimatedThemeBuilder.fromDynamic,
          schemaId: AnimatedThemeSchema.id,
        ),
        JsonAppBarBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAppBarBuilder.fromDynamic,
          schemaId: AppBarSchema.id,
        ),
        JsonAspectRatioBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAspectRatioBuilder.fromDynamic,
          schemaId: AspectRatioSchema.id,
        ),
        JsonAssetImageBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonAssetImageBuilder.fromDynamic,
          schemaId: AssetImageSchema.id,
        ),
        JsonBaselineBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonBaselineBuilder.fromDynamic,
          schemaId: BaselineSchema.id,
        ),
        JsonButtonBarBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonButtonBarBuilder.fromDynamic,
          schemaId: ButtonBarSchema.id,
        ),
        JsonCardBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonCardBuilder.fromDynamic,
          schemaId: CardSchema.id,
        ),
        JsonCenterBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonCenterBuilder.fromDynamic,
          schemaId: CenterSchema.id,
        ),
        JsonCheckboxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonCheckboxBuilder.fromDynamic,
          schemaId: CheckboxSchema.id,
        ),
        JsonCircularProgressIndicatorBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonCircularProgressIndicatorBuilder.fromDynamic,
          schemaId: CircularProgressIndicatorSchema.id,
        ),
        JsonClipOvalBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonClipOvalBuilder.fromDynamic,
          schemaId: ClipOvalSchema.id,
        ),
        JsonClipPathBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonClipPathBuilder.fromDynamic,
          schemaId: ClipPathSchema.id,
        ),
        JsonClipRectBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonClipRectBuilder.fromDynamic,
          schemaId: ClipRectSchema.id,
        ),
        JsonClipRRectBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonClipRRectBuilder.fromDynamic,
          schemaId: ClipRRectSchema.id,
        ),
        JsonColumnBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonColumnBuilder.fromDynamic,
          schemaId: ColumnSchema.id,
        ),
        JsonConditionalBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonConditionalBuilder.fromDynamic,
          schemaId: ConditionalSchema.id,
        ),
        JsonContainerBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonContainerBuilder.fromDynamic,
          schemaId: ContainerSchema.id,
        ),
        JsonCupertinoSwitchBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonCupertinoSwitchBuilder.fromDynamic,
          schemaId: CupertinoSwitchSchema.id,
        ),
        JsonDecoratedBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonDecoratedBoxBuilder.fromDynamic,
          schemaId: DecoratedBoxSchema.id,
        ),
        JsonDirectionalityBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonDirectionalityBuilder.fromDynamic,
          schemaId: DirectionalitySchema.id,
        ),
        JsonDropdownButtonFormFieldBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonDropdownButtonFormFieldBuilder.fromDynamic,
          schemaId: DropdownButtonFormFieldSchema.id,
        ),
        JsonDynamicBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonDynamicBuilder.fromDynamic,
          schemaId: DynamicSchema.id,
        ),
        JsonElevatedButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonElevatedButtonBuilder.fromDynamic,
          schemaId: ElevatedButtonSchema.id,
        ),
        JsonExcludeSemanticsBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonExcludeSemanticsBuilder.fromDynamic,
          schemaId: ExcludeSemanticsSchema.id,
        ),
        JsonExpandedBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonExpandedBuilder.fromDynamic,
          schemaId: ExpandedSchema.id,
        ),
        JsonFittedBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFittedBoxBuilder.fromDynamic,
          schemaId: FittedBoxSchema.id,
        ),
        JsonFlatButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFlatButtonBuilder.fromDynamic,
          schemaId: FlatButtonSchema.id,
        ),
        JsonFlexibleBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFlexibleBuilder.fromDynamic,
          schemaId: FlexibleSchema.id,
        ),
        JsonFloatingActionButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFloatingActionButtonBuilder.fromDynamic,
          schemaId: FloatingActionButtonSchema.id,
        ),
        JsonFormBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFormBuilder.fromDynamic,
          schemaId: FormSchema.id,
        ),
        JsonFractionalTranslationBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFractionalTranslationBuilder.fromDynamic,
          schemaId: FractionalTranslationSchema.id,
        ),
        JsonFractionallySizedBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonFractionallySizedBoxBuilder.fromDynamic,
          schemaId: FractionallySizedBoxSchema.id,
        ),
        JsonGestureDetectorBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonGestureDetectorBuilder.fromDynamic,
          schemaId: GestureDetectorSchema.id,
        ),
        JsonHeroBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonHeroBuilder.fromDynamic,
          schemaId: HeroSchema.id,
        ),
        JsonIconBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIconBuilder.fromDynamic,
          schemaId: IconSchema.id,
        ),
        JsonIconButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIconButtonBuilder.fromDynamic,
          schemaId: IconButtonSchema.id,
        ),
        JsonIgnorePointerBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIgnorePointerBuilder.fromDynamic,
          schemaId: IgnorePointerSchema.id,
        ),
        JsonIndexedStackBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIndexedStackBuilder.fromDynamic,
          schemaId: IndexedStackSchema.id,
        ),
        JsonInkWellBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonInkWellBuilder.fromDynamic,
          schemaId: InkWellSchema.id,
        ),
        JsonInputErrorBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonInputErrorBuilder.fromDynamic,
          schemaId: InputErrorSchema.id,
        ),
        JsonInteractiveViewerBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonInteractiveViewerBuilder.fromDynamic,
          schemaId: InteractiveViewerSchema.id,
        ),
        JsonIntrinsicHeightBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIntrinsicHeightBuilder.fromDynamic,
          schemaId: IntrinsicHeightSchema.id,
        ),
        JsonIntrinsicWidthBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonIntrinsicWidthBuilder.fromDynamic,
          schemaId: IntrinsicWidthSchema.id,
        ),
        JsonLayoutBuilderBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonLayoutBuilderBuilder.fromDynamic,
          schemaId: LayoutBuilderSchema.id,
        ),
        JsonLimitedBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonLimitedBoxBuilder.fromDynamic,
          schemaId: LimitedBoxSchema.id,
        ),
        JsonLinearProgressIndicatorBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonLinearProgressIndicatorBuilder.fromDynamic,
          schemaId: LinearProgressIndicatorSchema.id,
        ),
        JsonListTileBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonListTileBuilder.fromDynamic,
          schemaId: ListTileSchema.id,
        ),
        JsonListViewBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonListViewBuilder.fromDynamic,
          schemaId: ListViewSchema.id,
        ),
        JsonMeasuredBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonMeasuredBuilder.fromDynamic,
          schemaId: MeasuredSchema.id,
        ),
        JsonMaterialBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonMaterialBuilder.fromDynamic,
          schemaId: MaterialSchema.id,
        ),
        JsonMemoryImageBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonMemoryImageBuilder.fromDynamic,
          schemaId: MemoryImageSchema.id,
        ),
        JsonMergeSemanticsBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonMergeSemanticsBuilder.fromDynamic,
          schemaId: MergeSemanticsSchema.id,
        ),
        JsonNetworkImageBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonNetworkImageBuilder.fromDynamic,
          schemaId: NetworkImageSchema.id,
        ),
        JsonOffstageBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonOffstageBuilder.fromDynamic,
          schemaId: OffstageSchema.id,
        ),
        JsonOpacityBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonOpacityBuilder.fromDynamic,
          schemaId: OpacitySchema.id,
        ),
        JsonOutlinedButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonOutlinedButtonBuilder.fromDynamic,
          schemaId: OutlinedButtonSchema.id,
        ),
        JsonOverflowBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonOverflowBoxBuilder.fromDynamic,
          schemaId: OverflowBoxSchema.id,
        ),
        JsonPaddingBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonPaddingBuilder.fromDynamic,
          schemaId: PaddingSchema.id,
        ),
        JsonPlaceholderBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonPlaceholderBuilder.fromDynamic,
          schemaId: PlaceholderSchema.id,
        ),
        JsonPopupMenuButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonPopupMenuButtonBuilder.fromDynamic,
          schemaId: PopupMenuButtonSchema.id,
        ),
        JsonPositionedBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonPositionedBuilder.fromDynamic,
          schemaId: PositionedSchema.id,
        ),
        JsonRadioBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonRadioBuilder.fromDynamic,
          schemaId: RadioSchema.id,
        ),
        JsonRaisedButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonRaisedButtonBuilder.fromDynamic,
          schemaId: RaisedButtonSchema.id,
        ),
        JsonRowBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonRowBuilder.fromDynamic,
          schemaId: RowSchema.id,
        ),
        JsonSafeAreaBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSafeAreaBuilder.fromDynamic,
          schemaId: SafeAreaSchema.id,
        ),
        JsonSaveContextBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSaveContextBuilder.fromDynamic,
          schemaId: SaveContextSchema.id,
        ),
        JsonScaffoldBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonScaffoldBuilder.fromDynamic,
          schemaId: ScaffoldSchema.id,
        ),
        JsonSemanticsBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSemanticsBuilder.fromDynamic,
          schemaId: SemanticsSchema.id,
        ),
        JsonSetValueBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSetValueBuilder.fromDynamic,
          schemaId: SetValueSchema.id,
        ),
        JsonSetWidgetBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSetWidgetBuilder.fromDynamic,
          schemaId: SetWidgetSchema.id,
        ),
        JsonSingleChildScrollViewBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSingleChildScrollViewBuilder.fromDynamic,
          schemaId: SingleChildScrollViewSchema.id,
        ),
        JsonSizedBoxBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSizedBoxBuilder.fromDynamic,
          schemaId: SizedBoxSchema.id,
        ),
        JsonStackBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonStackBuilder.fromDynamic,
          schemaId: StackSchema.id,
        ),
        JsonSwitchBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonSwitchBuilder.fromDynamic,
          schemaId: SwitchSchema.id,
        ),
        JsonTestableBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonTestableBuilder.fromDynamic,
          schemaId: TestableSchema.id,
        ),
        JsonTextBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonTextBuilder.fromDynamic,
          schemaId: TextSchema.id,
        ),
        JsonTextButtonBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonTextButtonBuilder.fromDynamic,
          schemaId: TextButtonSchema.id,
        ),
        JsonTextFormFieldBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonTextFormFieldBuilder.fromDynamic,
          schemaId: TextFormFieldSchema.id,
        ),
        JsonTweenAnimationBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonTweenAnimationBuilder.fromDynamic,
          schemaId: TweenAnimationSchema.id,
        ),
        JsonThemeBuilder.type: JsonWidgetBuilderContainer(
          builder: JsonThemeBuilder.fromDynamic,
          schemaId: ThemeSchema.id,
        )
      };
}
