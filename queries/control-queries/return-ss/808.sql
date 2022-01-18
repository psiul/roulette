select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 28 and ss.ss_hash <= 361 and d.d_hash >= 596 and d.d_hash <= 996 and i.i_hash >= 18 and i.i_hash <= 768
;
