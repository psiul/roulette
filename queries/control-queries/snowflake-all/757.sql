select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,date_dim d,customer_demographics cd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 386 and i.i_hash <= 719 and d.d_hash >= 128 and d.d_hash <= 878 and cd.cd_hash >= 546 and cd.cd_hash <= 946
;
