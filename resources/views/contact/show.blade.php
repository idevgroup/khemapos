@extends('layouts.app')
@section('title', __('contact.view_contact'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header no-print">
    <h1>{{ __('contact.view_contact') }}</h1>
</section>

<!-- Main content -->
<section class="content no-print">
	<div class="box">
        <div class="box-header">
        	<h3 class="box-title">
                <i class="fa fa-user margin-r-5"></i>
                @if($contact->type == 'both') 
                    @lang( 'contact.contact_info', ['contact' => __('contact.contact') ])
                @else
                    @lang( 'contact.contact_info', ['contact' => ucfirst($contact->type) ])
                @endif
            </h3>
        </div>
        <div class="box-body">
            <span id="view_contact_page"></span>
            <div class="row">
                <div class="col-sm-3">
                    <div class="well well-sm">
                        <strong>{{ $contact->name }}</strong><br><br>
                        <strong><i class="fa fa-map-marker margin-r-5"></i> @lang('business.address')</strong>
                        <p class="text-muted">
                            @if($contact->landmark)
                                {{ $contact->landmark }}
                            @endif

                            {{ ', ' . $contact->city }}

                            @if($contact->state)
                                {{ ', ' . $contact->state }}
                            @endif
                            <br>
                            @if($contact->country)
                                {{ $contact->country }}
                            @endif
                        </p>
                        @if($contact->supplier_business_name)
                            <strong><i class="fa fa-briefcase margin-r-5"></i> 
                            @lang('business.business_name')</strong>
                            <p class="text-muted">
                                {{ $contact->supplier_business_name }}
                            </p>
                        @endif
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="well well-sm">
                        <strong><i class="fa fa-mobile margin-r-5"></i> @lang('contact.mobile')</strong>
                        <p class="text-muted">
                            {{ $contact->mobile }}
                        </p>
                        @if($contact->landline)
                            <strong><i class="fa fa-phone margin-r-5"></i> @lang('contact.landline')</strong>
                            <p class="text-muted">
                                {{ $contact->landline }}
                            </p>
                        @endif
                        @if($contact->alternate_number)
                            <strong><i class="fa fa-phone margin-r-5"></i> @lang('contact.alternate_contact_number')</strong>
                            <p class="text-muted">
                                {{ $contact->alternate_number }}
                            </p>
                        @endif

                        @if(!empty($contact->custom_field1))
                            <strong>@lang('lang_v1.custom_field', ['number' => 1])</strong>
                            <p class="text-muted">
                                {{ $contact->custom_field1 }}
                            </p>
                        @endif

                        @if(!empty($contact->custom_field2))
                            <strong>@lang('lang_v1.custom_field', ['number' => 2])</strong>
                            <p class="text-muted">
                                {{ $contact->custom_field2 }}
                            </p>
                        @endif

                        @if(!empty($contact->custom_field3))
                            <strong>@lang('lang_v1.custom_field', ['number' => 3])</strong>
                            <p class="text-muted">
                                {{ $contact->custom_field3 }}
                            </p>
                        @endif

                        @if(!empty($contact->custom_field4))
                            <strong>@lang('lang_v1.custom_field', ['number' => 4])</strong>
                            <p class="text-muted">
                                {{ $contact->custom_field4 }}
                            </p>
                        @endif
                    </div>
                </div>
                @if( $contact->type != 'customer')
                    <div class="col-sm-3">
                        <div class="well well-sm">
                            <strong><i class="fa fa-info margin-r-5"></i> @lang('contact.tax_no')</strong>
                            <p class="text-muted">
                                {{ $contact->tax_number }}
                            </p>
                            @if($contact->pay_term_type)
                                <strong><i class="fa fa-calendar margin-r-5"></i> @lang('contact.pay_term_period')</strong>
                                <p class="text-muted">
                                    {{ ucfirst($contact->pay_term_type) }}
                                </p>
                            @endif
                            @if($contact->pay_term_number)
                                <strong><i class="fa fa-handshake-o margin-r-5"></i> @lang('contact.pay_term')</strong>
                                <p class="text-muted">
                                    {{ $contact->pay_term_number }}
                                </p>
                            @endif
                        </div>
                    </div>
                @endif
                <div class="col-sm-3">
                    <div class="well well-sm">
                    @if( $contact->type == 'supplier' || $contact->type == 'both')
                        <strong>@lang('report.total_purchase')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->total_purchase }}</span>
                        </p>
                        <strong>@lang('contact.total_purchase_paid')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->purchase_paid }}</span>
                        </p>
                        <strong>@lang('contact.total_purchase_due')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->total_purchase - $contact->purchase_paid }}</span>
                        </p>
                    @endif
                    @if( $contact->type == 'customer' || $contact->type == 'both')
                        <strong>@lang('report.total_sell')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->total_invoice }}</span>
                        </p>
                        <strong>@lang('contact.total_sale_paid')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->invoice_received }}</span>
                        </p>
                        <strong>@lang('contact.total_sale_due')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->total_invoice - $contact->invoice_received }}</span>
                        </p>
                    @endif
                    @if(!empty($contact->opening_balance) && $contact->opening_balance != '0.00')
                        <strong>@lang('lang_v1.opening_balance')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->opening_balance }}</span>
                        </p>
                        <strong>@lang('lang_v1.opening_balance_due')</strong>
                        <p class="text-muted">
                        <span class="display_currency" data-currency_symbol="true">
                        {{ $contact->opening_balance - $contact->opening_balance_paid }}</span>
                        </p>
                    @endif
                    </div>
                </div>
                @if($reward_enabled)
                    <div class="clearfix"></div>
                    <div class="col-md-3">
                        <div class="info-box bg-yellow">
                            <span class="info-box-icon"><i class="fa fa-gift"></i></span>

                            <div class="info-box-content">
                              <span class="info-box-text">{{session('business.rp_name')}}</span>
                              <span class="info-box-number">{{$contact->total_rp ?? 0}}</span>
                            </div>
                            <!-- /.info-box-content -->
                        </div>
                    </div>
                @endif
                @if( $contact->type == 'supplier' || $contact->type == 'both')
                    <div class="clearfix"></div>
                    <div class="col-sm-12">
                        @if(($contact->total_purchase - $contact->purchase_paid) > 0)
                            <a href="{{action('TransactionPaymentController@getPayContactDue', [$contact->id])}}?type=purchase" class="pay_purchase_due btn btn-primary btn-sm pull-right"><i class="fa fa-money" aria-hidden="true"></i> @lang("contact.pay_due_amount")</a>
                        @endif
                    </div>
                @endif
            </div>
        </div>
    </div>
    <!-- list purchases -->

    @php
        $transaction_types = [];
        if(in_array($contact->type, ['both', 'supplier'])){
            $transaction_types['purchase'] = __('lang_v1.purchase');
            $transaction_types['purchase_return'] = __('lang_v1.purchase_return');
        }

        if(in_array($contact->type, ['both', 'customer'])){
            $transaction_types['sell'] = __('sale.sale');
            $transaction_types['sell_return'] = __('lang_v1.sell_return');
        }

        $transaction_types['opening_balance'] = __('lang_v1.opening_balance');
    @endphp

    @component('components.widget', ['class' => 'box-primary', 'title' => __('lang_v1.ledger')])
        <div class="row">
            <div class="col-md-12">
                @foreach($transaction_types as $key => $value)
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="checkbox">
                                <label>
                                  {!! Form::checkbox('transaction_types[]', $key, true, 
                                  [ 'class' => 'input-icheck transaction_types']); !!} {{$value}}
                                </label>
                            </div>
                        </div>
                    </div>
                @endforeach
                
                <div class="col-md-3">
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                              {!! Form::checkbox('show_payments', 1, true, 
                              [ 'class' => 'input-icheck', 'id' => 'show_payments']); !!} @lang('lang_v1.show_payments')
                            </label>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-3">
                    <div class="form-group">
                        {!! Form::label('ledger_date_range', __('report.date_range') . ':') !!}
                        {!! Form::text('ledger_date_range', null, ['placeholder' => __('lang_v1.select_a_date_range'), 'class' => 'form-control', 'readonly']); !!}
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div id="contact_ledger_div"></div>
            </div>
        </div>
    @endcomponent

    @if( in_array($contact->type, ['customer', 'both']) && session('business.enable_rp'))
        @component('components.widget', ['class' => 'box-primary', 'title' => session('business.rp_name')])
            <div class="table-responsive">
                <table class="table table-bordered table-striped" 
                id="rp_log_table">
                    <thead>
                        <tr>
                            <th>@lang('messages.date')</th>
                            <th>@lang('sale.invoice_no')</th>
                            <th>@lang('lang_v1.earned')</th>
                            <th>@lang('lang_v1.redeemed')</th>
                        </tr>
                    </thead>
                </table>
            </div>
        @endcomponent
    @endif
</section>
<!-- /.content -->
<div class="modal fade payment_modal" tabindex="-1" role="dialog" 
        aria-labelledby="gridSystemModalLabel">
</div>
<div class="modal fade edit_payment_modal" tabindex="-1" role="dialog" 
    aria-labelledby="gridSystemModalLabel">
</div>
<div class="modal fade pay_contact_due_modal" tabindex="-1" role="dialog" 
        aria-labelledby="gridSystemModalLabel"></div>
@stop
@section('javascript')
<script type="text/javascript">
$(document).ready( function(){
    $('#ledger_date_range').daterangepicker(
        dateRangeSettings,
        function (start, end) {
            $('#ledger_date_range').val(start.format(moment_date_format) + ' ~ ' + end.format(moment_date_format));
        }
    );
    $('#ledger_date_range').change( function(){
        get_contact_ledger();
    });
    get_contact_ledger();

    rp_log_table = $('#rp_log_table').DataTable({
        processing: true,
        serverSide: true,
        aaSorting: [[0, 'desc']],
        ajax: '/sells?customer_id={{ $contact->id }}&rewards_only=true',
        columns: [
            { data: 'transaction_date', name: 'transactions.transaction_date'  },
            { data: 'invoice_no', name: 'transactions.invoice_no'},
            { data: 'rp_earned', name: 'transactions.rp_earned'},
            { data: 'rp_redeemed', name: 'transactions.rp_redeemed'},
        ]
    });
});

$("input.transaction_types, input#show_payments").on('ifChanged', function (e) {
    get_contact_ledger();
});

function get_contact_ledger() {

    var start_date = '';
    var end_date = '';
    var transaction_types = $('input.transaction_types:checked').map(function(i, e) {return e.value}).toArray();
    var show_payments = $('input#show_payments').is(':checked');

    if($('#ledger_date_range').val()) {
        start_date = $('#ledger_date_range').data('daterangepicker').startDate.format('YYYY-MM-DD');
        end_date = $('#ledger_date_range').data('daterangepicker').endDate.format('YYYY-MM-DD');
    }
    $.ajax({
        url: '/contacts/ledger?contact_id={{$contact->id}}&start_date=' + start_date + '&transaction_types=' + transaction_types + '&show_payments=' + show_payments + '&end_date=' + end_date,
        dataType: 'html',
        success: function(result) {
            $('#contact_ledger_div')
                .html(result);
            __currency_convert_recursively($('#ledger_table'));

            $('#ledger_table').DataTable({
                searchable: false,
                ordering:false
            });
        },
    });
}
</script>
<script src="{{ asset('js/payment.js?v=' . $asset_v) }}"></script>

@endsection
