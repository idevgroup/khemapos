{!! Form::open(['url' => '#', 'method' => 'post', 'id' => 'preview_setting_form', 'onsubmit' => 'return false']) !!}

<div class="row">
    <div class="col-sm-12">
        <table class="table table-bordered table-striped table-condensed" id="product_table">
            <thead>
                <tr>
                    <th class="col-sm-8">@lang( 'barcode.products' )</th>
                    <th class="col-sm-4">@lang( 'barcode.no_of_labels' )</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($products as $product)
                <tr>
                    <td>
                        {{$product->product_name}}
                        @if($product->variation_name != "DUMMY")
                        <b>{{$product->variation_name}}</b>
                        @endif
                        <input type="hidden" name="products[{{$loop->index + $index}}][product_id]" value="{{$product->product_id}}">
                        <input type="hidden" name="products[{{$loop->index + $index}}][variation_id]" value="{{$product->variation_id}}">
                    </td>
                    <td>
                        <input type="number" class="form-control" min=1
                               name="products[{{$loop->index + $index}}][quantity]" value="@if(isset($product->quantity)){{$product->quantity}}@else{{1}}@endif">
                    </td>
                </tr>
                @empty
                @endforelse
            </tbody>
        </table>
    </div>
</div>

@component('components.widget', ['class' => 'box-primary', 'title' => __( 'barcode.info_in_labels' )])
<div class="row">
    <div class="col-sm-6">
        <div class="checkbox">
            <label>
                <input type="checkbox" checked name="print[name]" value="1"> <b>@lang( 'barcode.print_name' )</b>
            </label>
        </div>
    </div>

    <div class="col-sm-6">
        <div class="checkbox">
            <label>
                <input type="checkbox" checked name="print[variations]" value="1"> <b>@lang( 'barcode.print_variations' )</b>
            </label>
        </div>
    </div>

    <div class="col-sm-6">
        <div class="checkbox">
            <label>
                <input type="checkbox" checked name="print[price]" value="1" id="is_show_price"> <b>@lang( 'barcode.print_price' )</b>
            </label>
        </div>
    </div>

   

    <div class="col-sm-6">
        <div class="checkbox">
            <label>
                <input type="checkbox" checked name="print[business_name]" value="1"> <b>@lang( 'barcode.print_business_name' )</b>
            </label>
        </div>
    </div>
     <div class="col-sm-6" id="price_type_div">
        <div class="form-group">
            {!! Form::label('print[price_type]', @trans( 'barcode.show_price' ) . ':') !!}
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-info"></i>
                </span>
                {!! Form::select('print[price_type]', ['inclusive' => __('product.inc_of_tax'), 'exclusive' => __('product.exc_of_tax')], 'inclusive', ['class' => 'form-control']); !!}
            </div>
        </div>
    </div>
     <div class="col-sm-6">
        <div class="form-group">
            {!! Form::label('price_type', @trans( 'barcode.barcode_setting' ) . ':') !!}
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-cog"></i>
                </span>
                {!! Form::select('barcode_setting', $barcode_settings, null, ['class' => 'form-control']); !!}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <hr/>
    </div>

   
    <div class="col-sm-12">
        
            <button type="button" id="labels_preview" class="btn btn-primary btn-flat btn-block">@lang( 'barcode.preview' )</button>
        
    </div>
</div>
@endcomponent
{!! Form::close() !!}