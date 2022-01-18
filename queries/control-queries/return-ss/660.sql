select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 218 and d.d_hash <= 968 and cd.cd_hash >= 385 and cd.cd_hash <= 718 and i.i_hash >= 560 and i.i_hash <= 960
;
