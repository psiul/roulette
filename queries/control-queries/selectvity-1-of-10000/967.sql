select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 319 and ss.ss_hash <= 339 and i.i_hash >= 835 and i.i_hash <= 885 and hd.hd_hash >= 584 and hd.hd_hash <= 684
;
