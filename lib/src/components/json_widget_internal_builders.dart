import 'package:json_dynamic_widget/builders.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_dynamic_widget/src/schema/all.dart';

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
    builders[JsonAlignBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAlignBuilder.fromDynamic,
      schemaId: AlignSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedAlign() {
    builders[JsonAnimatedAlignBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedAlignBuilder.fromDynamic,
      schemaId: AnimatedAlignSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedContainer() {
    builders[JsonAnimatedContainerBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedContainerBuilder.fromDynamic,
      schemaId: AnimatedContainerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedCrossFade() {
    builders[JsonAnimatedCrossFadeBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedCrossFadeBuilder.fromDynamic,
      schemaId: AnimatedCrossFadeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedDefaultTextStyle() {
    builders[JsonAnimatedDefaultTextStyleBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedDefaultTextStyleBuilder.fromDynamic,
      schemaId: AnimatedDefaultTextStyleSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedOpacity() {
    builders[JsonAnimatedOpacityBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedOpacityBuilder.fromDynamic,
      schemaId: AnimatedOpacitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPadding() {
    builders[JsonAnimatedPaddingBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPaddingBuilder.fromDynamic,
      schemaId: AnimatedPaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPhysicalModel() {
    builders[JsonAnimatedPhysicalModelBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPhysicalModelBuilder.fromDynamic,
      schemaId: AnimatedPhysicalModelSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPositioned() {
    builders[JsonAnimatedPositionedBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedPositionedBuilder.fromDynamic,
      schemaId: AnimatedPositionedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedPositionedDirectional() {
    builders[JsonAnimatedPositionedDirectionalBuilder.type] =
        const JsonWidgetBuilderContainer(
            builder: JsonAnimatedPositionedDirectionalBuilder.fromDynamic,
            schemaId: AnimatedPositionedDirectionalSchema.id);
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedSize() {
    builders[JsonAnimatedSizeBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedSizeBuilder.fromDynamic,
      schemaId: AnimatedSizeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedSwitcher() {
    builders[JsonAnimatedSwitcherBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonAnimatedSwitcherBuilder.fromDynamic,
      schemaId: AnimatedSwitcherSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAnimatedTheme() {
    builders[JsonAnimatedThemeBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAnimatedThemeBuilder.fromDynamic,
      schemaId: AnimatedThemeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAppBar() {
    builders[JsonAppBarBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAppBarBuilder.fromDynamic,
      schemaId: AppBarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAspectRatio() {
    builders[JsonAspectRatioBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAspectRatioBuilder.fromDynamic,
      schemaId: AspectRatioSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withAssetImage() {
    builders[JsonAssetImageBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonAssetImageBuilder.fromDynamic,
      schemaId: AssetImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withBaseline() {
    builders[JsonBaselineBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonBaselineBuilder.fromDynamic,
      schemaId: BaselineSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withButtonBar() {
    builders[JsonButtonBarBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonButtonBarBuilder.fromDynamic,
      schemaId: ButtonBarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCard() {
    builders[JsonCardBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonCardBuilder.fromDynamic,
      schemaId: CardSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCenter() {
    builders[JsonCenterBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonCenterBuilder.fromDynamic,
      schemaId: CenterSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCheckbox() {
    builders[JsonCheckboxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonCheckboxBuilder.fromDynamic,
      schemaId: CheckboxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCircularProgressIndicator() {
    builders[JsonCircularProgressIndicatorBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonCircularProgressIndicatorBuilder.fromDynamic,
      schemaId: CircularProgressIndicatorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipOval() {
    builders[JsonClipOvalBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonClipOvalBuilder.fromDynamic,
      schemaId: ClipOvalSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipPath() {
    builders[JsonClipPathBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonClipPathBuilder.fromDynamic,
      schemaId: ClipPathSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipRect() {
    builders[JsonClipRectBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonClipRectBuilder.fromDynamic,
      schemaId: ClipRectSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withClipRRect() {
    builders[JsonClipRRectBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonClipRRectBuilder.fromDynamic,
      schemaId: ClipRRectSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withColumn() {
    builders[JsonColumnBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonColumnBuilder.fromDynamic,
      schemaId: ColumnSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withComment() {
    builders[JsonCommentBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonCommentBuilder.fromDynamic,
      schemaId: CommentSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withConditional() {
    builders[JsonConditionalBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonConditionalBuilder.fromDynamic,
      schemaId: ConditionalSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withContainer() {
    builders[JsonContainerBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonContainerBuilder.fromDynamic,
      schemaId: ContainerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCupertinoSwitch() {
    builders[JsonCupertinoSwitchBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonCupertinoSwitchBuilder.fromDynamic,
      schemaId: CupertinoSwitchSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withCustomScrollView() {
    builders[JsonCustomScrollViewBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonCustomScrollViewBuilder.fromDynamic,
      schemaId: CustomScrollViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDecoratedBox() {
    builders[JsonDecoratedBoxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonDecoratedBoxBuilder.fromDynamic,
      schemaId: DecoratedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDirectionality() {
    builders[JsonDirectionalityBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonDirectionalityBuilder.fromDynamic,
      schemaId: DirectionalitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDropdownButtonFormField() {
    builders[JsonDropdownButtonFormFieldBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonDropdownButtonFormFieldBuilder.fromDynamic,
      schemaId: DropdownButtonFormFieldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withDynamic() {
    builders[JsonDynamicBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonDynamicBuilder.fromDynamic,
      schemaId: DynamicSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withElevatedButton() {
    builders[JsonElevatedButtonBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonElevatedButtonBuilder.fromDynamic,
      schemaId: ElevatedButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withExcludeSemantics() {
    builders[JsonExcludeSemanticsBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonExcludeSemanticsBuilder.fromDynamic,
      schemaId: ExcludeSemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withExpanded() {
    builders[JsonExpandedBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonExpandedBuilder.fromDynamic,
      schemaId: ExpandedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFittedBox() {
    builders[JsonFittedBoxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonFittedBoxBuilder.fromDynamic,
      schemaId: FittedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFlexible() {
    builders[JsonFlexibleBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonFlexibleBuilder.fromDynamic,
      schemaId: FlexibleSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFloatingActionButton() {
    builders[JsonFloatingActionButtonBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonFloatingActionButtonBuilder.fromDynamic,
      schemaId: FloatingActionButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withForm() {
    builders[JsonFormBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonFormBuilder.fromDynamic,
      schemaId: FormSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFractionalTranslation() {
    builders[JsonFractionalTranslationBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonFractionalTranslationBuilder.fromDynamic,
      schemaId: FractionalTranslationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withFractionallySizedBox() {
    builders[JsonFractionallySizedBoxBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonFractionallySizedBoxBuilder.fromDynamic,
      schemaId: FractionallySizedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withGestureDetector() {
    builders[JsonGestureDetectorBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonGestureDetectorBuilder.fromDynamic,
      schemaId: GestureDetectorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withGridView() {
    builders[JsonGridViewBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonGridViewBuilder.fromDynamic,
      schemaId: GridViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withHero() {
    builders[JsonHeroBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonHeroBuilder.fromDynamic,
      schemaId: HeroSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIcon() {
    builders[JsonIconBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonIconBuilder.fromDynamic,
      schemaId: WrappedIconSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIconButton() {
    builders[JsonIconButtonBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonIconButtonBuilder.fromDynamic,
      schemaId: IconButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIgnorePointer() {
    builders[JsonIgnorePointerBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonIgnorePointerBuilder.fromDynamic,
      schemaId: IgnorePointerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIndexedStack() {
    builders[JsonIndexedStackBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonIndexedStackBuilder.fromDynamic,
      schemaId: IndexedStackSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInkWell() {
    builders[JsonInkWellBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonInkWellBuilder.fromDynamic,
      schemaId: InkWellSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInputError() {
    builders[JsonInputErrorBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonInputErrorBuilder.fromDynamic,
      schemaId: InputErrorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withInteractiveViewer() {
    builders[JsonInteractiveViewerBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonInteractiveViewerBuilder.fromDynamic,
      schemaId: InteractiveViewerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIntrinsicHeight() {
    builders[JsonIntrinsicHeightBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonIntrinsicHeightBuilder.fromDynamic,
      schemaId: IntrinsicHeightSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withIntrinsicWidth() {
    builders[JsonIntrinsicWidthBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonIntrinsicWidthBuilder.fromDynamic,
      schemaId: IntrinsicWidthSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLayoutBuilder() {
    builders[JsonLayoutBuilderBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonLayoutBuilderBuilder.fromDynamic,
      schemaId: LayoutBuilderSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLimitedBox() {
    builders[JsonLimitedBoxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonLimitedBoxBuilder.fromDynamic,
      schemaId: LimitedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withLinearProgressIndicator() {
    builders[JsonLinearProgressIndicatorBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonLinearProgressIndicatorBuilder.fromDynamic,
      schemaId: LinearProgressIndicatorSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withListTile() {
    builders[JsonListTileBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonListTileBuilder.fromDynamic,
      schemaId: ListTileSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withListView() {
    builders[JsonListViewBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonListViewBuilder.fromDynamic,
      schemaId: ListViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMeasured() {
    builders[JsonMeasuredBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonMeasuredBuilder.fromDynamic,
      schemaId: MeasuredSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMaterial() {
    builders[JsonMaterialBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonMaterialBuilder.fromDynamic,
      schemaId: MaterialSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMemoryImage() {
    builders[JsonMemoryImageBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonMemoryImageBuilder.fromDynamic,
      schemaId: MemoryImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withMergeSemantics() {
    builders[JsonMergeSemanticsBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonMergeSemanticsBuilder.fromDynamic,
      schemaId: MergeSemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withNetworkImage() {
    builders[JsonNetworkImageBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonNetworkImageBuilder.fromDynamic,
      schemaId: NetworkImageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOffstage() {
    builders[JsonOffstageBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonOffstageBuilder.fromDynamic,
      schemaId: OffstageSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOpacity() {
    builders[JsonOpacityBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonOpacityBuilder.fromDynamic,
      schemaId: OpacitySchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOutlinedButton() {
    builders[JsonOutlinedButtonBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonOutlinedButtonBuilder.fromDynamic,
      schemaId: OutlinedButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withOverflowBox() {
    builders[JsonOverflowBoxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonOverflowBoxBuilder.fromDynamic,
      schemaId: OverflowBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPadding() {
    builders[JsonPaddingBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonPaddingBuilder.fromDynamic,
      schemaId: PaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPlaceholder() {
    builders[JsonPlaceholderBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonPlaceholderBuilder.fromDynamic,
      schemaId: PlaceholderSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPopupMenuButton() {
    builders[JsonPopupMenuButtonBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonPopupMenuButtonBuilder.fromDynamic,
      schemaId: PopupMenuButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPositioned() {
    builders[JsonPositionedBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonPositionedBuilder.fromDynamic,
      schemaId: PositionedSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withPrimaryScrollController() {
    builders[JsonPrimaryScrollControllerBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonPrimaryScrollControllerBuilder.fromDynamic,
      schemaId: PrimaryScrollControllerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRadio() {
    builders[JsonRadioBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonRadioBuilder.fromDynamic,
      schemaId: RadioSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRichText() {
    builders[JsonRichTextBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonRichTextBuilder.fromDynamic,
      schemaId: RichTextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withRow() {
    builders[JsonRowBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonRowBuilder.fromDynamic,
      schemaId: RowSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSafeArea() {
    builders[JsonSafeAreaBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSafeAreaBuilder.fromDynamic,
      schemaId: SafeAreaSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSaveContext() {
    builders[JsonSaveContextBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSaveContextBuilder.fromDynamic,
      schemaId: SaveContextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScaffold() {
    builders[JsonScaffoldBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonScaffoldBuilder.fromDynamic,
      schemaId: ScaffoldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScrollConfiguration() {
    builders[JsonScrollConfigurationBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonScrollConfigurationBuilder.fromDynamic,
      schemaId: ScrollConfigurationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withScrollbar() {
    builders[JsonScrollbarBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonScrollbarBuilder.fromDynamic,
      schemaId: ScrollbarSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSemantics() {
    builders[JsonSemanticsBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSemanticsBuilder.fromDynamic,
      schemaId: SemanticsSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetScrollController() {
    builders[JsonSetScrollControllerBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonSetScrollControllerBuilder.fromDynamic,
      schemaId: SetScrollControllerSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetDefaultValue() {
    builders[JsonSetDefaultValueBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonSetDefaultValueBuilder.fromDynamic,
      schemaId: SetDefaultValueSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetValue() {
    builders[JsonSetValueBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSetValueBuilder.fromDynamic,
      schemaId: SetValueSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSetWidget() {
    builders[JsonSetWidgetBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSetWidgetBuilder.fromDynamic,
      schemaId: SetWidgetSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSingleChildScrollView() {
    builders[JsonSingleChildScrollViewBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonSingleChildScrollViewBuilder.fromDynamic,
      schemaId: SingleChildScrollViewSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSizedBox() {
    builders[JsonSizedBoxBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSizedBoxBuilder.fromDynamic,
      schemaId: SizedBoxSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverGrid() {
    builders[JsonSliverGridBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSliverGridBuilder.fromDynamic,
      schemaId: SliverGridSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverList() {
    builders[JsonSliverListBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSliverListBuilder.fromDynamic,
      schemaId: SliverListSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverPadding() {
    builders[JsonSliverPaddingBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSliverPaddingBuilder.fromDynamic,
      schemaId: SliverPaddingSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSliverToBoxAdapter() {
    builders[JsonSliverToBoxAdapterBuilder.type] =
        const JsonWidgetBuilderContainer(
      builder: JsonSliverToBoxAdapterBuilder.fromDynamic,
      schemaId: SliverToBoxAdapterSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withStack() {
    builders[JsonStackBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonStackBuilder.fromDynamic,
      schemaId: StackSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withSwitch() {
    builders[JsonSwitchBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonSwitchBuilder.fromDynamic,
      schemaId: SwitchSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withText() {
    builders[JsonTextBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonTextBuilder.fromDynamic,
      schemaId: TextSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTextButton() {
    builders[JsonTextButtonBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonTextButtonBuilder.fromDynamic,
      schemaId: TextButtonSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTextFormField() {
    builders[JsonTextFormFieldBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonTextFormFieldBuilder.fromDynamic,
      schemaId: TextFormFieldSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTooltip() {
    builders[JsonTooltipBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonTooltipBuilder.fromDynamic,
      schemaId: TooltipSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTweenAnimation() {
    builders[JsonTweenAnimationBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonTweenAnimationBuilder.fromDynamic,
      schemaId: TweenAnimationSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withTheme() {
    builders[JsonThemeBuilder.type] = const JsonWidgetBuilderContainer(
      builder: JsonThemeBuilder.fromDynamic,
      schemaId: ThemeSchema.id,
    );
    return this;
  }

  JsonWidgetInternalBuildersBuilder withWrap() {
    builders[JsonWrapBuilder.type] = const JsonWidgetBuilderContainer(
        builder: JsonWrapBuilder.fromDynamic, schemaId: WrapSchema.id);
    return this;
  }

  Map<String, JsonWidgetBuilderContainer> build() {
    return builders;
  }
}
