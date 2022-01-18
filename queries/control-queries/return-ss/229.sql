select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 143 and ss.ss_hash <= 476 and i.i_hash >= 26 and i.i_hash <= 776 and d.d_hash >= 98 and d.d_hash <= 498
;
