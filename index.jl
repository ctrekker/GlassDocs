### A Pluto.jl notebook ###
# v0.19.38

#> [frontmatter]
#> title = "GlassDocs"
#> sidebar = "false"

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ d871cef8-5f6d-4279-8949-616b6ca76396
# ╠═╡ show_logs = false
begin
	using Pkg; Pkg.activate("."); Pkg.instantiate()

	using HTMLStrings: to_html, head, link, script, divv, h1, img, p, span, a, figure, hr, select, option, label
	using PlutoUI, HypertextLiteral
	import AbstractPlutoDingetjes
	import AbstractPlutoDingetjes.Bonds
end

# ╔═╡ ba9e26af-94fc-47e0-9dfe-03fd0468c0c7
md"""
## Tutorials
"""

# ╔═╡ 5a5af88e-b35d-4660-90e9-60a864ae77bb
md"""
## Real-World Examples
Take a look at some examples of Glass Notebook being used for documentation, app development, teaching, and meta-packages. 

If you are ready to get started, take a look at the templates below this section.
"""

# ╔═╡ 546b7906-c112-4225-aa81-e7138ae352cb
to_html(
	divv(
		p(:class => "h-20"),
		hr()
	)
)

# ╔═╡ d6bd6300-5b14-4ab4-b519-ed59b466adb9
md"""
#### Appendix

Note that the cells used to create this homepage are hidden below. Go to GitHub to view the cells, or even better, look at the [tempates](https://glassnotebook.io/) folder to start creating your own homepage.
"""

# ╔═╡ 6ae1c5d0-4021-40ac-9bc0-bb9d0fab9fa4
TableOfContents()

# ╔═╡ 8cff59f5-3ee5-4608-a8b7-b5e6c3d4af17
themes = [
	"light",
	"dark",
	"cupcake",
	"bumblebee",
	"emerald",
	"corporate",
	"synthwave",
	"retro",
	"cyberpunk",
	"valentine",
	"halloween",
	"garden",
	"forest",
	"aqua",
	"lofi",
	"pastel",
	"fantasy",
	"wireframe",
	"black",
	"luxury",
	"dracula",
	"cmyk",
	"autumn",
	"business",
	"acid",
	"lemonade",
	"night",
	"coffee",
	"winter",
	"dim",
	"nord",
	"sunset",
];

# ╔═╡ 2e47591b-1156-4f07-9934-f7983a801c2c
function index_title_card(title::String, subtitle::String, image_url::String; data_theme::String = "pastel", border_color::String = "primary")
	return to_html(
	    divv(
	        head(
				link(:href => "https://cdn.jsdelivr.net/npm/daisyui@3.7.4/dist/full.css", :rel => "stylesheet", :type => "text/css"),
	            script(:src => "https://cdn.tailwindcss.com")
	        ),
			divv(:data_theme => "$data_theme", :class => "card card-bordered flex justify-center items-center border-$border_color text-center w-full dark:text-[#e6e6e6]",
				divv(:class => "card-body flex flex-col justify-center items-center",
					img(:src => "$image_url", :class => "h-24 w-24 md:h-40 md:w-40 rounded-md", :alt => "$title Logo"),
					divv(:class => "text-5xl font-bold bg-gradient-to-r from-accent to-primary inline-block text-transparent bg-clip-text py-10", "$title"),
					p(:class => "card-text text-md font-serif", "$subtitle"
					)
				)
			)
	    )
	)
end;

# ╔═╡ 6c8fc72b-145b-4f1f-9296-2fe8938eaf70
begin
	struct Article
		title::String
		path::String
		image_url::String
	end

	article_list_tutorials = Article[
		Article("Getting Started", "01_getting_started.jl", "https://img.freepik.com/free-vector/hand-drawn-starting-line-business-illustration_23-2149540609.jpg"),
		Article("Advanced Usage", "02_advanced.jl", "https://img.freepik.com/free-vector/trio-set-realistic-technology-collection-with-circels-squares-other-things-centre-blue_1284-49186.jpg"),
	]

	article_list_templates = Article[
		Article("Plain Repository", "templates/plain_repository/index.jl", "https://img.freepik.com/free-vector/notebook-mockup_1017-6288.jpg"),
		Article("Package Documentation", "templates/ExamplePackage/index.jl", "https://img.freepik.com/free-vector/online-document-concept-illustration_114360-5453.jpg"),
		Article("Teaching (TODO)", "", "https://img.freepik.com/free-vector/teacher-standing-near-blackboard-holding-stick-isolated-flat-vector-illustration-cartoon-woman-character-near-chalkboard-pointing-alphabet_74855-8600.jpg"),
		Article("Meta Package (TODO)", "", "https://img.freepik.com/free-vector/four-blue-puzzle-pieces_78370-1141.jpg"),
	]

	article_list_examples = Article[
		Article("CalciumScoring.jl Docs", "https://glassnotebook.io/r/zn0Xr-A1cYegYHSDJzSyO/index.jl", "https://img.freepik.com/free-vector/ct-scan-concept-illustration_114360-7073.jpg"),
		Article("Brain Dancer GUI", "https://glassnotebook.io/r/Wx63p40sJffuoB_ZkFy_D/index.jl", "https://alascience.com/wp-content/uploads/2020/07/Logo-registered-trademark.jpg"),
		Article("DistanceTransforms.jl Docs", "https://glassnotebook.io/r/DxnIPJnIqpEqiQnJgqiBP/index.jl", "https://img.freepik.com/free-vector/global-communication-background-business-network-vector-design_53876-151122.jpg"),
		Article("Computational Thinking (in Glass Notebook) (TODO)", "https://computationalthinking.mit.edu/Fall23/", "https://user-images.githubusercontent.com/6933510/136196552-ce16c06f-bd12-427f-80e5-aedb1fbc734a.png")
	]

	function article_card(article::Article, color::String; data_theme = "pastel")
	    a(:href => article.path, :class => "w-1/2 p-2",
			divv(:data_theme => "$data_theme", :class => "card card-bordered border-$color text-center dark:text-[#e6e6e6]",
				divv(:class => "card-body justify-center items-center h-40",
					p(:class => "card-title", article.title),
					p("Click to open the notebook")
				),
				figure(
					img(:class => "w-full h-48", :src => article.image_url, :alt => article.title)
				)
	        )
	    )
	end
end;

# ╔═╡ aac0e8aa-e54d-42d8-a36b-00c282da5664
# this is a fix for PlutoUI.jl#292
begin
	local result = begin
	"""
	```julia
	Select(options::Vector; [default])
	# or with a custom display value:
	Select(options::Vector{Pair{Any,String}}; [default::Any])
	```

	A dropdown menu - the user can choose an element of the `options` vector.

	See [`MultiSelect`](@ref) for a version that allows multiple selected items.

	# Examples
	```julia
	@bind veg Select(["potato", "carrot"])
	```
	
	```julia
	@bind f Select([sin, cos, tan, sqrt])
	
	f(0.5)
	```

	You can also specify a display value by giving pairs `bound_value => display_value`:
	
	```julia
	@bind f Select([cos => "cosine function", sin => "sine function"])

	f(0.5)
	```
	"""
	struct Select
		options::AbstractVector{Pair}
		default::Union{Missing, Any}
	end
	end
	
	Select(options::AbstractVector; default=missing) = Select([o => o for o in options], default)
	
	Select(options::AbstractVector{<:Pair}; default=missing) = Select(options, default)
	
	function Base.show(io::IO, m::MIME"text/html", select::Select)

		
		# compat code
		if !AbstractPlutoDingetjes.is_supported_by_display(io, Bonds.transform_value)
			compat_element = try
				OldSelect(select.options, select.default)
			catch
				HTML("<span>❌ You need to update Pluto to use this PlutoUI element.</span>")
			end
			return show(io, m, compat_element)
		end

		
		show(io, m, @htl(
			"""<select>$(
		map(enumerate(select.options)) do (i,o)
				@htl(
				"<option value='puiselect-$(i)' selected=$(!ismissing(select.default) && o.first == select.default)>$(
				string(o.second)
				)</option>")
			end
		)</select>"""))
	end

	Base.get(select::Select) = ismissing(select.default) ? first(select.options).first : select.default
	Bonds.initial_value(select::Select) = ismissing(select.default) ? first(select.options).first : select.default
	
	Bonds.possible_values(select::Select) = ("puiselect-$(i)" for i in 1:length(select.options))
	
	function Bonds.transform_value(select::Select, val_from_js)
		if startswith(val_from_js, "puiselect-")
			val_num = tryparse(Int64, @view val_from_js[begin+10:end])
			select.options[val_num].first
		else
			# and OldSelect was rendered
			val_from_js
		end
	end
	
	function Bonds.validate_value(select::Select, val_from_js)
		(val_from_js isa String) || return false
		if startswith(val_from_js, "puiselect-")
			val_num = tryparse(Int64, @view val_from_js[begin+10:end])
			val_num isa Integer && val_num ∈ eachindex(select.options)
		else
			# and OldSelect was rendered
			any(key == val_from_js for (key,val) in select.options)
		end
	end

	nothing
end

# ╔═╡ 2afbaa0e-5ee0-42f4-a036-acda049ad0e5
md"""
Choose Theme: $(@bind theme Select(themes, default = "night"))
"""

# ╔═╡ 49fe3920-26ab-4873-8413-3418d5552f7f
data_theme = theme;

# ╔═╡ e72eb673-ee5e-4e61-9188-0c7381efbdab
index_title_card(
	"GlassDocs",
	"Publish, interactive Pluto.jl notebooks with one click",
	"https://github.com/Dale-Black/GlassDocs/blob/master/assets/icon.png?raw=true";
	data_theme = data_theme
)

# ╔═╡ 305ef451-9de9-4005-8495-2066052e9be8
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "secondary"; data_theme = data_theme) for article in article_list_tutorials]...
    )
)

# ╔═╡ 0b32fad4-0ec7-4590-952f-ec438ce1900a
to_html(
    divv(:class => "flex flex-wrap justify-center items-start",
        [article_card(article, "accent"; data_theme = data_theme) for article in article_list_examples]...
    )
)

# ╔═╡ Cell order:
# ╟─2afbaa0e-5ee0-42f4-a036-acda049ad0e5
# ╟─e72eb673-ee5e-4e61-9188-0c7381efbdab
# ╟─ba9e26af-94fc-47e0-9dfe-03fd0468c0c7
# ╟─305ef451-9de9-4005-8495-2066052e9be8
# ╟─5a5af88e-b35d-4660-90e9-60a864ae77bb
# ╟─0b32fad4-0ec7-4590-952f-ec438ce1900a
# ╟─546b7906-c112-4225-aa81-e7138ae352cb
# ╟─d6bd6300-5b14-4ab4-b519-ed59b466adb9
# ╟─d871cef8-5f6d-4279-8949-616b6ca76396
# ╟─6ae1c5d0-4021-40ac-9bc0-bb9d0fab9fa4
# ╟─49fe3920-26ab-4873-8413-3418d5552f7f
# ╟─8cff59f5-3ee5-4608-a8b7-b5e6c3d4af17
# ╟─2e47591b-1156-4f07-9934-f7983a801c2c
# ╟─6c8fc72b-145b-4f1f-9296-2fe8938eaf70
# ╟─aac0e8aa-e54d-42d8-a36b-00c282da5664
