select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 254 and ss.ss_hash <= 587 and d.d_hash >= 417 and d.d_hash <= 817 and hd.hd_hash >= 27 and hd.hd_hash <= 777
;
