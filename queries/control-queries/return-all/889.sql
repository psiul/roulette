select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,item i,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and d.d_hash >= 393 and d.d_hash <= 726 and i.i_hash >= 17 and i.i_hash <= 767 and c.c_hash >= 467 and c.c_hash <= 867
;
