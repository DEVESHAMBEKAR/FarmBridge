import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

// Shells
import 'shells/buyer_shell.dart';
import 'shells/farmer_shell.dart';
import 'shells/delivery_shell.dart';

// Auth & Public
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/language_selection_screen.dart';
import '../../features/auth/presentation/onboarding_success_screen.dart';
import '../../features/auth/presentation/farmer_profile_setup_screen.dart';
import '../../features/auth/presentation/buyer_profile_setup_screen.dart';
import '../../features/auth/presentation/logistics_profile_setup_screen.dart';
import '../../features/auth/presentation/verification_pending_screen.dart';
import '../../features/admin/presentation/admin_web_only_screen.dart';
import '../../features/auth/presentation/auth_screen.dart';
import '../../features/auth/presentation/otp_screen.dart';
import '../../features/auth/presentation/role_selection_screen.dart';

// Global Cross-Cutting
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';

// Buyer
import '../../features/buyer/presentation/buyer_home_screen.dart';
import '../../features/marketplace/presentation/marketplace_screen.dart';
import '../../features/buyer/presentation/buyer_orders_screen.dart';
import '../../features/chat/presentation/chat_list_screen.dart';
import '../../features/profile/presentation/buyer_profile_screen.dart';
import '../../features/marketplace/presentation/product_details_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/marketplace/presentation/checkout_screen.dart';

// Farmer
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/farmer/presentation/farmer_products_screen.dart';
import '../../features/farmer/presentation/add_new_crop_screen.dart';
import '../../features/farmer/presentation/farmer_orders_screen.dart';
import '../../features/farmer/presentation/farmer_analytics_dashboard_screen.dart';
import '../../features/farmer/presentation/farmer_negotiations_screen.dart';

// Delivery
import '../../features/delivery/presentation/delivery_dashboard_screen.dart';
import '../../features/delivery/presentation/delivery_assigned_screen.dart';
import '../../features/delivery/presentation/delivery_map_screen.dart';
import '../../features/delivery/presentation/delivery_history_screen.dart';
import '../../features/profile/presentation/delivery_profile_screen.dart';

// Dealer
import '../../features/dealer/presentation/dealer_home_screen.dart';
import '../../features/dealer/presentation/bulk_search_screen.dart';
import '../../features/dealer/presentation/post_requirement_screen.dart';
import '../../features/dealer/presentation/negotiation_screen.dart';
import '../../features/dealer/presentation/negotiation_chat_screen.dart';
import '../../features/profile/presentation/dealer_profile_screen.dart';
import '../../features/auth/presentation/dealer_profile_setup_screen.dart';
import 'shells/dealer_shell.dart';

// Admin
import '../../features/admin/presentation/admin_dashboard_screen.dart';
import '../../features/admin/presentation/admin_users_screen.dart';
import '../../features/admin/presentation/admin_farmers_screen.dart';
import '../../features/admin/presentation/admin_orders_screen.dart';
import '../../features/admin/presentation/admin_products_screen.dart';
import '../../features/admin/presentation/admin_logistics_screen.dart';
import '../../features/admin/presentation/admin_audit_logs_screen.dart';
import '../../features/admin/presentation/admin_settings_screen.dart';
import '../../features/admin/presentation/admin_dispatch_screen.dart';
import '../../features/admin/presentation/admin_partner_selection_screen.dart';
import '../../features/admin/presentation/admin_third_party_screen.dart';
import 'shells/admin_shell.dart';

// Routes that don't require authentication
const _publicRoutes = ['/splash', '/auth', '/otp', '/language', '/onboarding'];

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _buyerHomeKey = GlobalKey<NavigatorState>(debugLabel: 'buyerHome');
final GlobalKey<NavigatorState> _buyerMarketKey = GlobalKey<NavigatorState>(debugLabel: 'buyerMarket');
final GlobalKey<NavigatorState> _buyerOrdersKey = GlobalKey<NavigatorState>(debugLabel: 'buyerOrders');
final GlobalKey<NavigatorState> _buyerChatKey = GlobalKey<NavigatorState>(debugLabel: 'buyerChat');
final GlobalKey<NavigatorState> _buyerProfileKey = GlobalKey<NavigatorState>(debugLabel: 'buyerProfile');

final GlobalKey<NavigatorState> _farmerDashKey = GlobalKey<NavigatorState>(debugLabel: 'farmerDash');
final GlobalKey<NavigatorState> _farmerProdKey = GlobalKey<NavigatorState>(debugLabel: 'farmerProd');
final GlobalKey<NavigatorState> _farmerOrdersKey = GlobalKey<NavigatorState>(debugLabel: 'farmerOrders');
final GlobalKey<NavigatorState> _farmerAnalyticsKey = GlobalKey<NavigatorState>(debugLabel: 'farmerAnalytics');
final GlobalKey<NavigatorState> _farmerNegotiationsKey = GlobalKey<NavigatorState>(debugLabel: 'farmerNegotiations');
final GlobalKey<NavigatorState> _farmerProfileKey = GlobalKey<NavigatorState>(debugLabel: 'farmerProfile');

final GlobalKey<NavigatorState> _deliveryDashKey = GlobalKey<NavigatorState>(debugLabel: 'deliveryDash');
final GlobalKey<NavigatorState> _deliveryAssignedKey = GlobalKey<NavigatorState>(debugLabel: 'deliveryAssigned');
final GlobalKey<NavigatorState> _deliveryMapKey = GlobalKey<NavigatorState>(debugLabel: 'deliveryMap');
final GlobalKey<NavigatorState> _deliveryHistoryKey = GlobalKey<NavigatorState>(debugLabel: 'deliveryHistory');
final GlobalKey<NavigatorState> _deliveryProfileKey = GlobalKey<NavigatorState>(debugLabel: 'deliveryProfile');

final GlobalKey<NavigatorState> _dealerHomeKey = GlobalKey<NavigatorState>(debugLabel: 'dealerHome');
final GlobalKey<NavigatorState> _dealerSearchKey = GlobalKey<NavigatorState>(debugLabel: 'dealerSearch');
final GlobalKey<NavigatorState> _dealerPostKey = GlobalKey<NavigatorState>(debugLabel: 'dealerPost');
final GlobalKey<NavigatorState> _dealerProfileKey = GlobalKey<NavigatorState>(debugLabel: 'dealerProfile');

final GlobalKey<NavigatorState> _adminDashKey = GlobalKey<NavigatorState>(debugLabel: 'adminDash');
final GlobalKey<NavigatorState> _adminUsersKey = GlobalKey<NavigatorState>(debugLabel: 'adminUsers');
final GlobalKey<NavigatorState> _adminFarmersKey = GlobalKey<NavigatorState>(debugLabel: 'adminFarmers');
final GlobalKey<NavigatorState> _adminLogisticsKey = GlobalKey<NavigatorState>(debugLabel: 'adminLogistics');
final GlobalKey<NavigatorState> _adminProductsKey = GlobalKey<NavigatorState>(debugLabel: 'adminProducts');
final GlobalKey<NavigatorState> _adminOrdersKey = GlobalKey<NavigatorState>(debugLabel: 'adminOrders');
final GlobalKey<NavigatorState> _adminAuditLogsKey = GlobalKey<NavigatorState>(debugLabel: 'adminAuditLogs');
final GlobalKey<NavigatorState> _adminSettingsKey = GlobalKey<NavigatorState>(debugLabel: 'adminSettings');


final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isLoggedIn = user != null;
      final currentPath = state.matchedLocation;

      // Allow public routes without auth
      if (_publicRoutes.contains(currentPath)) {
        // If already logged in and trying to access auth screen, skip to role-selection
        if (isLoggedIn && currentPath == '/auth') {
          return '/role-selection';
        }
        return null; // Allow access
      }

      // All other routes require authentication
      if (!isLoggedIn) {
        return '/auth';
      }

      return null; // Allow access
    },
    routes: [
      // ==========================================
      // PUBLIC & AUTH ROUTES
      // ==========================================
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/language',
        builder: (context, state) => const LanguageSelectionScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingSuccessScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/otp',
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: '/role-selection',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      
      // ==========================================
      // GLOBAL ROUTES (Pushed over root navigator)
      // ==========================================
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const NotificationsScreen(),
      ),

      // ==========================================
      // â”€â”€â”€ ROOT ROUTES â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

      GoRoute(
        path: '/farmer/profile-setup',
        builder: (context, state) => const FarmerProfileSetupScreen(),
      ),
      GoRoute(
        path: '/buyer/profile-setup',
        builder: (context, state) => const BuyerProfileSetupScreen(),
      ),
      GoRoute(
        path: '/dealer/profile-setup',
        builder: (context, state) => const DealerProfileSetupScreen(),
      ),
      GoRoute(
        path: '/delivery/profile-setup',
        builder: (context, state) => const LogisticsProfileSetupScreen(),
      ),
      GoRoute(
        path: '/verification-pending',
        builder: (context, state) => const VerificationPendingScreen(),
      ),
      GoRoute(
        path: '/admin/web-only',
        builder: (context, state) => const AdminWebOnlyScreen(),
      ),

      // â”€â”€â”€ BUYER APP â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
      // ==========================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BuyerShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _buyerHomeKey,
            routes: [
              GoRoute(
                path: '/buyer/home',
                builder: (context, state) => const BuyerHomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _buyerMarketKey,
            routes: [
              GoRoute(
                path: '/buyer/marketplace',
                builder: (context, state) => const MarketplaceScreen(),
                routes: [
                  GoRoute(
                    path: 'product/:id',
                    builder: (context, state) => ProductDetailsScreen(productId: state.pathParameters['id']!),
                  ),
                  GoRoute(
                    path: 'cart',
                    builder: (context, state) => const CartScreen(),
                  ),
                  GoRoute(
                    path: 'checkout',
                    builder: (context, state) => const CheckoutScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _buyerOrdersKey,
            routes: [
              GoRoute(
                path: '/buyer/orders',
                builder: (context, state) => const BuyerOrdersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _buyerChatKey,
            routes: [
              GoRoute(
                path: '/buyer/chat',
                builder: (context, state) => const ChatListScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _buyerProfileKey,
            routes: [
              GoRoute(
                path: '/buyer/profile',
                builder: (context, state) => const BuyerProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ==========================================
      // FARMER APP (StatefulShellRoute)
      // ==========================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return FarmerShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _farmerDashKey,
            routes: [
              GoRoute(
                path: '/farmer/dashboard',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _farmerProdKey,
            routes: [
              GoRoute(
                path: '/farmer/products',
                builder: (context, state) => const FarmerProductsScreen(),
                routes: [
                  GoRoute(
                    path: 'add',
                    builder: (context, state) => const AddNewCropScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _farmerOrdersKey,
            routes: [
              GoRoute(
                path: '/farmer/orders',
                builder: (context, state) => const FarmerOrdersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _farmerAnalyticsKey,
            routes: [
              GoRoute(
                path: '/farmer/analytics',
                builder: (context, state) => const FarmerAnalyticsDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _farmerNegotiationsKey,
            routes: [
              GoRoute(
                path: '/farmer/negotiations',
                builder: (context, state) => const FarmerNegotiationsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _farmerProfileKey,
            routes: [
              GoRoute(
                path: '/farmer/profile',
                builder: (context, state) => const Scaffold(body: Center(child: Text('Farmer Profile Screen'))),
              ),
            ],
          ),
        ],
      ),

      // ==========================================
      // DELIVERY APP (StatefulShellRoute)
      // ==========================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DeliveryShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _deliveryDashKey,
            routes: [
              GoRoute(
                path: '/delivery/dashboard',
                builder: (context, state) => const DeliveryDashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _deliveryAssignedKey,
            routes: [
              GoRoute(
                path: '/delivery/assigned',
                builder: (context, state) => const DeliveryAssignedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _deliveryMapKey,
            routes: [
              GoRoute(
                path: '/delivery/map',
                builder: (context, state) => const DeliveryMapScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _deliveryHistoryKey,
            routes: [
              GoRoute(
                path: '/delivery/history',
                builder: (context, state) => const DeliveryHistoryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _deliveryProfileKey,
            routes: [
              GoRoute(
                path: '/delivery/profile',
                builder: (context, state) => const DeliveryProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ==========================================
      // DEALER APP (StatefulShellRoute)
      // ==========================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DealerShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _dealerHomeKey,
            routes: [
              GoRoute(
                path: '/dealer/home',
                builder: (context, state) => const DealerHomeScreen(),
                routes: [
                  GoRoute(
                    path: 'negotiation/:negotiationId',
                    builder: (context, state) => NegotiationChatScreen(
                      negotiationId: state.pathParameters['negotiationId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _dealerSearchKey,
            routes: [
              GoRoute(
                path: '/dealer/search',
                builder: (context, state) => const BulkSearchScreen(),
                routes: [
                  GoRoute(
                    path: 'negotiate/:productId/:farmerId',
                    builder: (context, state) => NegotiationScreen(
                      productId: state.pathParameters['productId']!,
                      farmerId: state.pathParameters['farmerId']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _dealerPostKey,
            routes: [
              GoRoute(
                path: '/dealer/post',
                builder: (context, state) => const PostRequirementScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _dealerProfileKey,
            routes: [
              GoRoute(
                path: '/dealer/profile',
                builder: (context, state) => const DealerProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ==========================================
      // ADMIN APP (StatefulShellRoute)
      // ==========================================
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AdminShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _adminDashKey,
            routes: [
              GoRoute(
                path: '/admin/dashboard',
                builder: (context, state) => const AdminDashboardScreen(),
                routes: [
                  GoRoute(
                    path: 'dispatch',
                    builder: (context, state) => const AdminDispatchScreen(),
                    routes: [
                      GoRoute(
                        path: 'assign-partner/:requestId',
                        builder: (context, state) => AdminPartnerSelectionScreen(
                          transportRequestId: state.pathParameters['requestId']!,
                        ),
                      ),
                      GoRoute(
                        path: 'third-party/:requestId',
                        builder: (context, state) => AdminThirdPartyScreen(
                          transportRequestId: state.pathParameters['requestId']!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminUsersKey,
            routes: [
              GoRoute(
                path: '/admin/users',
                builder: (context, state) => const AdminUsersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminFarmersKey,
            routes: [
              GoRoute(
                path: '/admin/farmers',
                builder: (context, state) => const AdminFarmersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminLogisticsKey,
            routes: [
              GoRoute(
                path: '/admin/logistics',
                builder: (context, state) => const AdminLogisticsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminProductsKey,
            routes: [
              GoRoute(
                path: '/admin/products',
                builder: (context, state) => const AdminProductsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminOrdersKey,
            routes: [
              GoRoute(
                path: '/admin/orders',
                builder: (context, state) => const AdminOrdersScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminAuditLogsKey,
            routes: [
              GoRoute(
                path: '/admin/audit-logs',
                builder: (context, state) => const AdminAuditLogsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _adminSettingsKey,
            routes: [
              GoRoute(
                path: '/admin/settings',
                builder: (context, state) => const AdminSettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

