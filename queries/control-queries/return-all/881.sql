select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 148 and ss.ss_hash <= 898 and i.i_hash >= 307 and i.i_hash <= 707 and cd.cd_hash >= 550 and cd.cd_hash <= 883
;
