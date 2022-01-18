select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 289 and ss.ss_hash <= 622 and c.c_hash >= 595 and c.c_hash <= 995 and d.d_hash >= 19 and d.d_hash <= 769
;
