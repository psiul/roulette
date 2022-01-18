select count(ws.ws_item_sk)
from web_sales ws,item i,web_returns wr,household_demographics hd,date_dim d
where ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and wr.wr_returned_date_sk = d.d_date_sk and ws.ws_hash >= 196 and ws.ws_hash <= 529 and i.i_hash >= 216 and i.i_hash <= 966 and d.d_hash >= 492 and d.d_hash <= 892
;
