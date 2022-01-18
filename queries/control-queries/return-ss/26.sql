select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 550 and ss.ss_hash <= 950 and cd.cd_hash >= 86 and cd.cd_hash <= 836 and i.i_hash >= 86 and i.i_hash <= 419
;
