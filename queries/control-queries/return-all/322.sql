select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,web_returns wr,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 208 and ws.ws_hash <= 541 and d.d_hash >= 173 and d.d_hash <= 573 and hd.hd_hash >= 151 and hd.hd_hash <= 901
;
