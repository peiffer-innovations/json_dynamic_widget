import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
// import 'package:json_dynamic_widget/src/schema/all.dart';

class JsonWidgetInternalBuilders {
  static Map<String, JsonWidgetBuilderContainer> defaults() =>
      JsonWidgetInternalBuildersBuilder()
          .withAlign()
          .withAnimatedAlign()
          .withAnimatedContainer()
          .withAnimatedCrossFade()
          .withAnimatedDefaultTextStyle()
          .withAnimatedOpacity()
          .withAnimatedPadding()
          .withAnimatedPhysicalModel()
          .withAnimatedPositioned()
          .withAnimatedPositionedDirectional()
          .withAnimatedSize()
          .withAnimatedSwitcher()
          .withAnimatedTheme()
          .withAppBar()
          .withAspectRatio()
          .withAssetImage()
          .withBaseline()
          .withButtonBar()
          .withCard()
          .withCenter()
          .withCheckbox()
          .withCircularProgressIndicator()
          .withClipOval()
          .withClipPath()
          .withClipRect()
          .withClipRRect()
          .withColumn()
          .withComment()
          .withConditional()
          .withContainer()
          .withCupertinoSwitch()
          .withCustomScrollView()
          .withDecoratedBox()
          .withDirectionality()
          .withDropdownButtonFormField()
          .withDynamic()
          .withElevatedButton()
          .withExcludeSemantics()
          .withExpanded()
          .withFittedBox()
          .withFlexible()
          .withFloatingActionButton()
          .withForm()
          .withFractionalTranslation()
          .withFractionallySizedBox()
          .withGestureDetector()
          .withGridView()
          .withHero()
          .withIcon()
          .withIconButton()
          .withIgnorePointer()
          .withIndexedStack()
          .withInkWell()
          .withInputError()
          .withInteractiveViewer()
          .withIntrinsicHeight()
          .withIntrinsicWidth()
          .withLayoutBuilder()
          .withLimitedBox()
          .withLinearProgressIndicator()
          .withListTile()
          .withListView()
          .withMeasured()
          .withMaterial()
          .withMemoryImage()
          .withMergeSemantics()
          .withNetworkImage()
          .withOffstage()
          .withOpacity()
          .withOutlinedButton()
          .withOverflowBox()
          .withPadding()
          .withPlaceholder()
          .withPopupMenuButton()
          .withPositioned()
          .withPrimaryScrollController()
          .withRadio()
          .withRichText()
          .withRow()
          .withSafeArea()
          .withSaveContext()
          .withScaffold()
          .withScrollConfiguration()
          .withScrollbar()
          .withSemantics()
          .withSetScrollController()
          .withSetDefaultValue()
          .withSetValue()
          .withSetWidget()
          .withSingleChildScrollView()
          .withSizedBox()
          .withSliverGrid()
          .withSliverList()
          .withSliverPadding()
          .withSliverToBoxAdapter()
          .withStack()
          .withSwitch()
          .withText()
          .withTextButton()
          .withTextFormField()
          .withTooltip()
          .withTweenAnimation()
          .withTheme()
          .withWrap()
          .build();
}

/// Used to create the selected subset of all internal builders.
class JsonWidgetInternalBuildersBuilder {
  Map<String, JsonWidgetBuilderContainer> builders =
      <String, JsonWidgetBuilderContainer>{};

  JsonWidgetInternalBuildersBuilder withAlign() {
    builders[JsonAlignBuilder.kType] = JsonWidgetBuilderContainer(
      builder: JsonAlignBuilder.fromDynamic,
      schemaId: AlignSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedAlign() {
    builders[JsonAnimatedAlignBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedAlignBuilder.fromDynamic,
      schemaId: AnimatedAlignSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedContainer() {
    builders[JsonAnimatedContainerBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedContainerBuilder.fromDynamic,
      schemaId: AnimatedContainerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedCrossFade() {
    builders[JsonAnimatedCrossFadeBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedCrossFadeBuilder.fromDynamic,
      schemaId: AnimatedCrossFadeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedDefaultTextStyle() {
    builders[JsonAnimatedDefaultTextStyleBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedDefaultTextStyleBuilder.fromDynamic,
      schemaId: AnimatedDefaultTextStyleSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedOpacity() {
    builders[JsonAnimatedOpacityBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedOpacityBuilder.fromDynamic,
      schemaId: AnimatedOpacitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPadding() {
    builders[JsonAnimatedPaddingBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPaddingBuilder.fromDynamic,
      schemaId: AnimatedPaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPhysicalModel() {
    builders[JsonAnimatedPhysicalModelBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPhysicalModelBuilder.fromDynamic,
      schemaId: AnimatedPhysicalModelSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPositioned() {
    builders[JsonAnimatedPositionedBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPositionedBuilder.fromDynamic,
      schemaId: AnimatedPositionedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPositionedDirectional() {
    builders[JsonAnimatedPositionedDirectionalBuilder.kType] =
        const JsonWidgetBuilderContainer(
            builder: JsonAnimatedPositionedDirectionalBuilder.fromDynamic,
            schemaId: AnimatedPositionedDirectionalSchema.id);
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedSize() {
    builders[JsonAnimatedSizeBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedSizeBuilder.fromDynamic,
      schemaId: AnimatedSizeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedSwitcher() {
    builders[JsonAnimatedSwitcherBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedSwitcherBuilder.fromDynamic,
      schemaId: AnimatedSwitcherSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedTheme() {
    builders[JsonAnimatedThemeBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedThemeBuilder.fromDynamic,
      schemaId: AnimatedThemeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAppBar() {
    builders[JsonAppBarBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAppBarBuilder.fromDynamic,
      schemaId: AppBarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAspectRatio() {
    builders[JsonAspectRatioBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAspectRatioBuilder.fromDynamic,
      schemaId: AspectRatioSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAssetImage() {
    builders[JsonAssetImageBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonAssetImageBuilder.fromDynamic,
      schemaId: AssetImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withBaseline() {
    builders[JsonBaselineBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonBaselineBuilder.fromDynamic,
      schemaId: BaselineSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withButtonBar() {
    builders[JsonButtonBarBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonButtonBarBuilder.fromDynamic,
      schemaId: ButtonBarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCard() {
    builders[JsonCardBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonCardBuilder.fromDynamic,
      schemaId: CardSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCenter() {
    builders[JsonCenterBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonCenterBuilder.fromDynamic,
      schemaId: CenterSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCheckbox() {
    builders[JsonCheckboxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonCheckboxBuilder.fromDynamic,
      schemaId: CheckboxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCircularProgressIndicator() {
    builders[JsonCircularProgressIndicatorBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonCircularProgressIndicatorBuilder.fromDynamic,
      schemaId: CircularProgressIndicatorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipOval() {
    builders[JsonClipOvalBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonClipOvalBuilder.fromDynamic,
      schemaId: ClipOvalSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipPath() {
    builders[JsonClipPathBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonClipPathBuilder.fromDynamic,
      schemaId: ClipPathSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipRect() {
    builders[JsonClipRectBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonClipRectBuilder.fromDynamic,
      schemaId: ClipRectSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipRRect() {
    builders[JsonClipRRectBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonClipRRectBuilder.fromDynamic,
      schemaId: ClipRRectSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withColumn() {
    builders[JsonColumnBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonColumnBuilder.fromDynamic,
      schemaId: ColumnSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withComment() {
    builders[JsonCommentBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonCommentBuilder.fromDynamic,
      schemaId: CommentSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withConditional() {
    builders[JsonConditionalBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonConditionalBuilder.fromDynamic,
      schemaId: ConditionalSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withContainer() {
    builders[JsonContainerBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonContainerBuilder.fromDynamic,
      schemaId: ContainerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCupertinoSwitch() {
    builders[JsonCupertinoSwitchBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonCupertinoSwitchBuilder.fromDynamic,
      schemaId: CupertinoSwitchSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCustomScrollView() {
    builders[JsonCustomScrollViewBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonCustomScrollViewBuilder.fromDynamic,
      schemaId: CustomScrollViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDecoratedBox() {
    builders[JsonDecoratedBoxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonDecoratedBoxBuilder.fromDynamic,
      schemaId: DecoratedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDirectionality() {
    builders[JsonDirectionalityBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonDirectionalityBuilder.fromDynamic,
      schemaId: DirectionalitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDropdownButtonFormField() {
    builders[JsonDropdownButtonFormFieldBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonDropdownButtonFormFieldBuilder.fromDynamic,
      schemaId: DropdownButtonFormFieldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDynamic() {
    builders[JsonDynamicBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonDynamicBuilder.fromDynamic,
      schemaId: DynamicSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withElevatedButton() {
    builders[JsonElevatedButtonBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonElevatedButtonBuilder.fromDynamic,
      schemaId: ElevatedButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withExcludeSemantics() {
    builders[JsonExcludeSemanticsBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonExcludeSemanticsBuilder.fromDynamic,
      schemaId: ExcludeSemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withExpanded() {
    builders[JsonExpandedBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonExpandedBuilder.fromDynamic,
      schemaId: ExpandedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFittedBox() {
    builders[JsonFittedBoxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonFittedBoxBuilder.fromDynamic,
      schemaId: FittedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFlexible() {
    builders[JsonFlexibleBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonFlexibleBuilder.fromDynamic,
      schemaId: FlexibleSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFloatingActionButton() {
    builders[JsonFloatingActionButtonBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonFloatingActionButtonBuilder.fromDynamic,
      schemaId: FloatingActionButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withForm() {
    builders[JsonFormBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonFormBuilder.fromDynamic,
      schemaId: FormSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFractionalTranslation() {
    builders[JsonFractionalTranslationBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonFractionalTranslationBuilder.fromDynamic,
      schemaId: FractionalTranslationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFractionallySizedBox() {
    builders[JsonFractionallySizedBoxBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonFractionallySizedBoxBuilder.fromDynamic,
      schemaId: FractionallySizedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withGestureDetector() {
    builders[JsonGestureDetectorBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonGestureDetectorBuilder.fromDynamic,
      schemaId: GestureDetectorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withGridView() {
    builders[JsonGridViewBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonGridViewBuilder.fromDynamic,
      schemaId: GridViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withHero() {
    builders[JsonHeroBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonHeroBuilder.fromDynamic,
      schemaId: HeroSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIcon() {
    builders[JsonIconBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonIconBuilder.fromDynamic,
      schemaId: WrappedIconSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIconButton() {
    builders[JsonIconButtonBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonIconButtonBuilder.fromDynamic,
      schemaId: IconButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIgnorePointer() {
    builders[JsonIgnorePointerBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonIgnorePointerBuilder.fromDynamic,
      schemaId: IgnorePointerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIndexedStack() {
    builders[JsonIndexedStackBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonIndexedStackBuilder.fromDynamic,
      schemaId: IndexedStackSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInkWell() {
    builders[JsonInkWellBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonInkWellBuilder.fromDynamic,
      schemaId: InkWellSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInputError() {
    builders[JsonInputErrorBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonInputErrorBuilder.fromDynamic,
      schemaId: InputErrorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInteractiveViewer() {
    builders[JsonInteractiveViewerBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonInteractiveViewerBuilder.fromDynamic,
      schemaId: InteractiveViewerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIntrinsicHeight() {
    builders[JsonIntrinsicHeightBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonIntrinsicHeightBuilder.fromDynamic,
      schemaId: IntrinsicHeightSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIntrinsicWidth() {
    builders[JsonIntrinsicWidthBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonIntrinsicWidthBuilder.fromDynamic,
      schemaId: IntrinsicWidthSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLayoutBuilder() {
    builders[JsonLayoutBuilderBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonLayoutBuilderBuilder.fromDynamic,
      schemaId: LayoutBuilderSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLimitedBox() {
    builders[JsonLimitedBoxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonLimitedBoxBuilder.fromDynamic,
      schemaId: LimitedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLinearProgressIndicator() {
    builders[JsonLinearProgressIndicatorBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonLinearProgressIndicatorBuilder.fromDynamic,
      schemaId: LinearProgressIndicatorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withListTile() {
    builders[JsonListTileBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonListTileBuilder.fromDynamic,
      schemaId: ListTileSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withListView() {
    builders[JsonListViewBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonListViewBuilder.fromDynamic,
      schemaId: ListViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMeasured() {
    builders[JsonMeasuredBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonMeasuredBuilder.fromDynamic,
      schemaId: MeasuredSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMaterial() {
    builders[JsonMaterialBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonMaterialBuilder.fromDynamic,
      schemaId: MaterialSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMemoryImage() {
    builders[JsonMemoryImageBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonMemoryImageBuilder.fromDynamic,
      schemaId: MemoryImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMergeSemantics() {
    builders[JsonMergeSemanticsBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonMergeSemanticsBuilder.fromDynamic,
      schemaId: MergeSemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withNetworkImage() {
    builders[JsonNetworkImageBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonNetworkImageBuilder.fromDynamic,
      schemaId: NetworkImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOffstage() {
    builders[JsonOffstageBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonOffstageBuilder.fromDynamic,
      schemaId: OffstageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOpacity() {
    builders[JsonOpacityBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonOpacityBuilder.fromDynamic,
      schemaId: OpacitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOutlinedButton() {
    builders[JsonOutlinedButtonBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonOutlinedButtonBuilder.fromDynamic,
      schemaId: OutlinedButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOverflowBox() {
    builders[JsonOverflowBoxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonOverflowBoxBuilder.fromDynamic,
      schemaId: OverflowBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPadding() {
    builders[JsonPaddingBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonPaddingBuilder.fromDynamic,
      schemaId: PaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPlaceholder() {
    builders[JsonPlaceholderBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonPlaceholderBuilder.fromDynamic,
      schemaId: PlaceholderSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPopupMenuButton() {
    builders[JsonPopupMenuButtonBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonPopupMenuButtonBuilder.fromDynamic,
      schemaId: PopupMenuButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPositioned() {
    builders[JsonPositionedBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonPositionedBuilder.fromDynamic,
      schemaId: PositionedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPrimaryScrollController() {
    builders[JsonPrimaryScrollControllerBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonPrimaryScrollControllerBuilder.fromDynamic,
      schemaId: PrimaryScrollControllerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRadio() {
    builders[JsonRadioBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonRadioBuilder.fromDynamic,
      schemaId: RadioSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRichText() {
    builders[JsonRichTextBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonRichTextBuilder.fromDynamic,
      schemaId: RichTextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRow() {
    builders[JsonRowBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonRowBuilder.fromDynamic,
      schemaId: RowSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSafeArea() {
    builders[JsonSafeAreaBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSafeAreaBuilder.fromDynamic,
      schemaId: SafeAreaSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSaveContext() {
    builders[JsonSaveContextBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSaveContextBuilder.fromDynamic,
      schemaId: SaveContextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScaffold() {
    builders[JsonScaffoldBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonScaffoldBuilder.fromDynamic,
      schemaId: ScaffoldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScrollConfiguration() {
    builders[JsonScrollConfigurationBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonScrollConfigurationBuilder.fromDynamic,
      schemaId: ScrollConfigurationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScrollbar() {
    builders[JsonScrollbarBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonScrollbarBuilder.fromDynamic,
      schemaId: ScrollbarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSemantics() {
    builders[JsonSemanticsBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSemanticsBuilder.fromDynamic,
      schemaId: SemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetScrollController() {
    builders[JsonSetScrollControllerBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonSetScrollControllerBuilder.fromDynamic,
      schemaId: SetScrollControllerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetDefaultValue() {
    builders[JsonSetDefaultValueBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonSetDefaultValueBuilder.fromDynamic,
      schemaId: SetDefaultValueSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetValue() {
    builders[JsonSetValueBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSetValueBuilder.fromDynamic,
      schemaId: SetValueSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetWidget() {
    builders[JsonSetWidgetBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSetWidgetBuilder.fromDynamic,
      schemaId: SetWidgetSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSingleChildScrollView() {
    builders[JsonSingleChildScrollViewBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonSingleChildScrollViewBuilder.fromDynamic,
      schemaId: SingleChildScrollViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSizedBox() {
    builders[JsonSizedBoxBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSizedBoxBuilder.fromDynamic,
      schemaId: SizedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverGrid() {
    builders[JsonSliverGridBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSliverGridBuilder.fromDynamic,
      schemaId: SliverGridSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverList() {
    builders[JsonSliverListBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSliverListBuilder.fromDynamic,
      schemaId: SliverListSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverPadding() {
    builders[JsonSliverPaddingBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSliverPaddingBuilder.fromDynamic,
      schemaId: SliverPaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverToBoxAdapter() {
    builders[JsonSliverToBoxAdapterBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonSliverToBoxAdapterBuilder.fromDynamic,
      schemaId: SliverToBoxAdapterSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withStack() {
    builders[JsonStackBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonStackBuilder.fromDynamic,
      schemaId: StackSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSwitch() {
    builders[JsonSwitchBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonSwitchBuilder.fromDynamic,
      schemaId: SwitchSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withText() {
    builders[JsonTextBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonTextBuilder.fromDynamic,
      schemaId: TextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTextButton() {
    builders[JsonTextButtonBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonTextButtonBuilder.fromDynamic,
      schemaId: TextButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTextFormField() {
    builders[JsonTextFormFieldBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonTextFormFieldBuilder.fromDynamic,
      schemaId: TextFormFieldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTooltip() {
    builders[JsonTooltipBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonTooltipBuilder.fromDynamic,
      schemaId: TooltipSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTweenAnimation() {
    builders[JsonTweenAnimationBuilder.kType] =
        const JsonWidgetBuilderContainer(
      builder: JsonTweenAnimationBuilder.fromDynamic,
      schemaId: TweenAnimationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTheme() {
    builders[JsonThemeBuilder.kType] = const JsonWidgetBuilderContainer(
      builder: JsonThemeBuilder.fromDynamic,
      schemaId: ThemeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withWrap() {
    builders[JsonWrapBuilder.kType] = const JsonWidgetBuilderContainer(
        builder: JsonWrapBuilder.fromDynamic, schemaId: WrapSchema.id);
    return this;
  }

  Map<String, JsonWidgetBuilderContainer> build() {
    return builders;
  }
}
