select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 462 and ss.ss_hash <= 795 and i.i_hash >= 52 and i.i_hash <= 802 and hd.hd_hash >= 107 and hd.hd_hash <= 507
;
