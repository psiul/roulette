select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,web_returns wr,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 47 and d.d_hash <= 380 and i.i_hash >= 119 and i.i_hash <= 869 and hd.hd_hash >= 259 and hd.hd_hash <= 659
;
