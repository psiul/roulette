select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,item i,web_returns wr
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and d.d_hash >= 175 and d.d_hash <= 925 and hd.hd_hash >= 364 and hd.hd_hash <= 764 and i.i_hash >= 291 and i.i_hash <= 624
;
