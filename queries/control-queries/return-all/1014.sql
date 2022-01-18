select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,date_dim d,ship_mode sm,household_demographics hd
where ws.ws_order_number = wr.wr_order_number and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 605 and ws.ws_hash <= 938 and d.d_hash >= 187 and d.d_hash <= 587 and sm.sm_hash >= 76 and sm.sm_hash <= 826
;
