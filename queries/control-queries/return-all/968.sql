select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 572 and ss.ss_hash <= 905 and cd.cd_hash >= 106 and cd.cd_hash <= 506 and i.i_hash >= 47 and i.i_hash <= 797
;
