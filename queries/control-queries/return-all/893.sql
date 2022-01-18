select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,item i,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 177 and ss.ss_hash <= 577 and d.d_hash >= 56 and d.d_hash <= 806 and i.i_hash >= 589 and i.i_hash <= 922
;
