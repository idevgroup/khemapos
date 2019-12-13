<div class="row">
    <input type="hidden" class="payment_row_index" value="{{ $row_index}}">
    @php
    $col_class = 'col-md-6';
    if(!empty($accounts)){
    $col_class = 'col-md-4';
    }
    @endphp
    <div class="{{$col_class}}">
        <div class="form-group">
            {!! Form::label("amount_$row_index" ,__('sale.amount') . ' USD:*') !!}
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-money"></i>
                </span>
                {!! Form::text("payment[$row_index][amount]", @num_format($payment_line['amount']), ['class' => 'form-control payment-amount input_number payment-in-usd', 'required', 'id' => "amount_$row_index", 'placeholder' => __('sale.amount')]); !!}
            </div>
        </div>
    </div>
    <div class="{{$col_class}}">

        <div class="form-group">
            {!! Form::label("method_$row_index" , __('lang_v1.payment_method') . ':*') !!}
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-money"></i>
                </span>
                {!! Form::select("payment[$row_index][method]", $payment_types, $payment_line['method'], ['class' => 'form-control col-md-12 payment_types_dropdown', 'required', 'id' => "method_$row_index", 'style' => 'width:100%;']); !!}
            </div>
        </div>
    </div>
    <div class="{{$col_class}}">
        <div class="form-group">
            {!! Form::label("amountkhr_$row_index" ,__('sale.amount') . ' KHR:') !!}

            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-money"></i>
                </span>
                {!! Form::text("payment[$row_index][amount_khr]", @num_format($payment_line['amount_khr']), ['class' => 'form-control payment-amount-khr input_number', 'id' => "amountkhr_$row_index", 'placeholder' => __('sale.amount')]); !!}
            </div>
        </div>
    </div>
    <div class="{{$col_class}}">
        <div class="form-group">
            <a class="btn btn-app btn-amount btn-success" data-atm="usd" data-row="{{$row_index}}">
                <i class="fa fa-usd"></i> USD
            </a>
            <a class="btn btn-app btn-amount btn-success" data-atm="khr" data-row="{{$row_index}}">
                <i class="fa fa-khr">&#x17db;</i> KHR
            </a>
        </div>
    </div>
    @if(!empty($accounts))
    <div class="{{$col_class}}">
        <div class="form-group">
            {!! Form::label("account_$row_index" , __('lang_v1.payment_account') . ':') !!}
            <div class="input-group">
                <span class="input-group-addon">
                    <i class="fa fa-money"></i>
                </span>
                {!! Form::select("payment[$row_index][account_id]", $accounts, !empty($payment_line['account_id']) ? $payment_line['account_id'] : '' , ['class' => 'form-control select2', 'id' => "account_$row_index", 'style' => 'width:100%;']); !!}
            </div>
        </div>
    </div>
    @endif
    <div class="clearfix"></div>
    @include('sale_pos.partials.payment_type_details')
    <div class="col-md-12">
        <div class="form-group">
            {!! Form::label("note_$row_index", __('sale.payment_note') . ':') !!}
            {!! Form::textarea("payment[$row_index][note]", $payment_line['note'], ['class' => 'form-control', 'rows' => 3, 'id' => "note_$row_index"]); !!}
        </div>
    </div>
</div>