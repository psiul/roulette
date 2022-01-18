select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,item i,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 48 and ws.ws_hash <= 448 and d.d_hash >= 125 and d.d_hash <= 875 and cd.cd_hash >= 229 and cd.cd_hash <= 562
;
