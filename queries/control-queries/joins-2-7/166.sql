select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 711 and ss.ss_hash <= 911 and i.i_hash >= 53 and i.i_hash <= 553
;
