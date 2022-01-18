select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 228 and ss.ss_hash <= 978 and i.i_hash >= 652 and i.i_hash <= 985 and hd.hd_hash >= 158 and hd.hd_hash <= 558
;
