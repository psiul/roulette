select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 586 and ss.ss_hash <= 919 and i.i_hash >= 12 and i.i_hash <= 762 and d.d_hash >= 280 and d.d_hash <= 680
;
