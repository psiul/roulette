select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,item i,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_item_sk = i.i_item_sk and wr.wr_returning_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 173 and ws.ws_hash <= 923 and d.d_hash >= 420 and d.d_hash <= 753 and cd.cd_hash >= 143 and cd.cd_hash <= 543
;
