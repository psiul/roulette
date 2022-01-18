select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,item i,household_demographics hd,date_dim d
where ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and i.i_hash >= 617 and i.i_hash <= 950 and hd.hd_hash >= 160 and hd.hd_hash <= 910 and d.d_hash >= 366 and d.d_hash <= 766
;
