select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 261 and ss.ss_hash <= 594 and d.d_hash >= 143 and d.d_hash <= 543 and cd.cd_hash >= 177 and cd.cd_hash <= 927
;