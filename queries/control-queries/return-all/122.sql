select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 368 and ss.ss_hash <= 701 and d.d_hash >= 394 and d.d_hash <= 794 and i.i_hash >= 119 and i.i_hash <= 869
;
